#-- start of make_header -----------------

#====================================
#  Library ZdZdPlotting
#
#   Generated Fri Dec  2 18:47:11 2016  by diboye
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_ZdZdPlotting_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_ZdZdPlotting_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_ZdZdPlotting

ZdZdPlotting_tag = $(tag)

#cmt_local_tagfile_ZdZdPlotting = $(ZdZdPlotting_tag)_ZdZdPlotting.make
cmt_local_tagfile_ZdZdPlotting = $(bin)$(ZdZdPlotting_tag)_ZdZdPlotting.make

else

tags      = $(tag),$(CMTEXTRATAGS)

ZdZdPlotting_tag = $(tag)

#cmt_local_tagfile_ZdZdPlotting = $(ZdZdPlotting_tag).make
cmt_local_tagfile_ZdZdPlotting = $(bin)$(ZdZdPlotting_tag).make

endif

include $(cmt_local_tagfile_ZdZdPlotting)
#-include $(cmt_local_tagfile_ZdZdPlotting)

ifdef cmt_ZdZdPlotting_has_target_tag

cmt_final_setup_ZdZdPlotting = $(bin)setup_ZdZdPlotting.make
cmt_dependencies_in_ZdZdPlotting = $(bin)dependencies_ZdZdPlotting.in
#cmt_final_setup_ZdZdPlotting = $(bin)ZdZdPlotting_ZdZdPlottingsetup.make
cmt_local_ZdZdPlotting_makefile = $(bin)ZdZdPlotting.make

else

cmt_final_setup_ZdZdPlotting = $(bin)setup.make
cmt_dependencies_in_ZdZdPlotting = $(bin)dependencies.in
#cmt_final_setup_ZdZdPlotting = $(bin)ZdZdPlottingsetup.make
cmt_local_ZdZdPlotting_makefile = $(bin)ZdZdPlotting.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)ZdZdPlottingsetup.make

#ZdZdPlotting :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'ZdZdPlotting'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = ZdZdPlotting/
#ZdZdPlotting::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

ZdZdPlottinglibname   = $(bin)$(library_prefix)ZdZdPlotting$(library_suffix)
ZdZdPlottinglib       = $(ZdZdPlottinglibname).a
ZdZdPlottingstamp     = $(bin)ZdZdPlotting.stamp
ZdZdPlottingshstamp   = $(bin)ZdZdPlotting.shstamp

ZdZdPlotting :: dirs  ZdZdPlottingLIB
	$(echo) "ZdZdPlotting ok"

#-- end of libary_header ----------------
#-- start of library_no_static ------

#ZdZdPlottingLIB :: $(ZdZdPlottinglib) $(ZdZdPlottingshstamp)
ZdZdPlottingLIB :: $(ZdZdPlottingshstamp)
	$(echo) "ZdZdPlotting : library ok"

$(ZdZdPlottinglib) :: $(bin)ZdZdPlottingAlg.o $(bin)ZdZdPlotting_load.o $(bin)ZdZdPlotting_entries.o
	$(lib_echo) "static library $@"
	$(lib_silent) cd $(bin); \
	  $(ar) $(ZdZdPlottinglib) $?
	$(lib_silent) $(ranlib) $(ZdZdPlottinglib)
	$(lib_silent) cat /dev/null >$(ZdZdPlottingstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

#
# We add one level of dependency upon the true shared library 
# (rather than simply upon the stamp file)
# this is for cases where the shared library has not been built
# while the stamp was created (error??) 
#

$(ZdZdPlottinglibname).$(shlibsuffix) :: $(bin)ZdZdPlottingAlg.o $(bin)ZdZdPlotting_load.o $(bin)ZdZdPlotting_entries.o $(use_requirements) $(ZdZdPlottingstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) $(shlibbuilder) $(shlibflags) -o $@ $(bin)ZdZdPlottingAlg.o $(bin)ZdZdPlotting_load.o $(bin)ZdZdPlotting_entries.o $(ZdZdPlotting_shlibflags)
	$(lib_silent) cat /dev/null >$(ZdZdPlottingstamp) && \
	  cat /dev/null >$(ZdZdPlottingshstamp)

$(ZdZdPlottingshstamp) :: $(ZdZdPlottinglibname).$(shlibsuffix)
	$(lib_silent) if test -f $(ZdZdPlottinglibname).$(shlibsuffix) ; then \
	  cat /dev/null >$(ZdZdPlottingstamp) && \
	  cat /dev/null >$(ZdZdPlottingshstamp) ; fi

ZdZdPlottingclean ::
	$(cleanup_echo) objects ZdZdPlotting
	$(cleanup_silent) /bin/rm -f $(bin)ZdZdPlottingAlg.o $(bin)ZdZdPlotting_load.o $(bin)ZdZdPlotting_entries.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)ZdZdPlottingAlg.o $(bin)ZdZdPlotting_load.o $(bin)ZdZdPlotting_entries.o) $(patsubst %.o,%.dep,$(bin)ZdZdPlottingAlg.o $(bin)ZdZdPlotting_load.o $(bin)ZdZdPlotting_entries.o) $(patsubst %.o,%.d.stamp,$(bin)ZdZdPlottingAlg.o $(bin)ZdZdPlotting_load.o $(bin)ZdZdPlotting_entries.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf ZdZdPlotting_deps ZdZdPlotting_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
ZdZdPlottinginstallname = $(library_prefix)ZdZdPlotting$(library_suffix).$(shlibsuffix)

ZdZdPlotting :: ZdZdPlottinginstall ;

install :: ZdZdPlottinginstall ;

ZdZdPlottinginstall :: $(install_dir)/$(ZdZdPlottinginstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(ZdZdPlottinginstallname) :: $(bin)$(ZdZdPlottinginstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(ZdZdPlottinginstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##ZdZdPlottingclean :: ZdZdPlottinguninstall

uninstall :: ZdZdPlottinguninstall ;

ZdZdPlottinguninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(ZdZdPlottinginstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of library_no_static ------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),ZdZdPlottingclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ZdZdPlottingAlg.d

$(bin)$(binobj)ZdZdPlottingAlg.d :

$(bin)$(binobj)ZdZdPlottingAlg.o : $(cmt_final_setup_ZdZdPlotting)

$(bin)$(binobj)ZdZdPlottingAlg.o : $(src)ZdZdPlottingAlg.cxx
	$(cpp_echo) $(src)ZdZdPlottingAlg.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(ZdZdPlotting_pp_cppflags) $(lib_ZdZdPlotting_pp_cppflags) $(ZdZdPlottingAlg_pp_cppflags) $(use_cppflags) $(ZdZdPlotting_cppflags) $(lib_ZdZdPlotting_cppflags) $(ZdZdPlottingAlg_cppflags) $(ZdZdPlottingAlg_cxx_cppflags)  $(src)ZdZdPlottingAlg.cxx
endif
endif

else
$(bin)ZdZdPlotting_dependencies.make : $(ZdZdPlottingAlg_cxx_dependencies)

$(bin)ZdZdPlotting_dependencies.make : $(src)ZdZdPlottingAlg.cxx

$(bin)$(binobj)ZdZdPlottingAlg.o : $(ZdZdPlottingAlg_cxx_dependencies)
	$(cpp_echo) $(src)ZdZdPlottingAlg.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ZdZdPlotting_pp_cppflags) $(lib_ZdZdPlotting_pp_cppflags) $(ZdZdPlottingAlg_pp_cppflags) $(use_cppflags) $(ZdZdPlotting_cppflags) $(lib_ZdZdPlotting_cppflags) $(ZdZdPlottingAlg_cppflags) $(ZdZdPlottingAlg_cxx_cppflags)  $(src)ZdZdPlottingAlg.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),ZdZdPlottingclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ZdZdPlotting_load.d

$(bin)$(binobj)ZdZdPlotting_load.d :

$(bin)$(binobj)ZdZdPlotting_load.o : $(cmt_final_setup_ZdZdPlotting)

$(bin)$(binobj)ZdZdPlotting_load.o : $(src)components/ZdZdPlotting_load.cxx
	$(cpp_echo) $(src)components/ZdZdPlotting_load.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(ZdZdPlotting_pp_cppflags) $(lib_ZdZdPlotting_pp_cppflags) $(ZdZdPlotting_load_pp_cppflags) $(use_cppflags) $(ZdZdPlotting_cppflags) $(lib_ZdZdPlotting_cppflags) $(ZdZdPlotting_load_cppflags) $(ZdZdPlotting_load_cxx_cppflags) -I../src/components $(src)components/ZdZdPlotting_load.cxx
endif
endif

else
$(bin)ZdZdPlotting_dependencies.make : $(ZdZdPlotting_load_cxx_dependencies)

$(bin)ZdZdPlotting_dependencies.make : $(src)components/ZdZdPlotting_load.cxx

$(bin)$(binobj)ZdZdPlotting_load.o : $(ZdZdPlotting_load_cxx_dependencies)
	$(cpp_echo) $(src)components/ZdZdPlotting_load.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ZdZdPlotting_pp_cppflags) $(lib_ZdZdPlotting_pp_cppflags) $(ZdZdPlotting_load_pp_cppflags) $(use_cppflags) $(ZdZdPlotting_cppflags) $(lib_ZdZdPlotting_cppflags) $(ZdZdPlotting_load_cppflags) $(ZdZdPlotting_load_cxx_cppflags) -I../src/components $(src)components/ZdZdPlotting_load.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),ZdZdPlottingclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ZdZdPlotting_entries.d

$(bin)$(binobj)ZdZdPlotting_entries.d :

$(bin)$(binobj)ZdZdPlotting_entries.o : $(cmt_final_setup_ZdZdPlotting)

$(bin)$(binobj)ZdZdPlotting_entries.o : $(src)components/ZdZdPlotting_entries.cxx
	$(cpp_echo) $(src)components/ZdZdPlotting_entries.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(ZdZdPlotting_pp_cppflags) $(lib_ZdZdPlotting_pp_cppflags) $(ZdZdPlotting_entries_pp_cppflags) $(use_cppflags) $(ZdZdPlotting_cppflags) $(lib_ZdZdPlotting_cppflags) $(ZdZdPlotting_entries_cppflags) $(ZdZdPlotting_entries_cxx_cppflags) -I../src/components $(src)components/ZdZdPlotting_entries.cxx
endif
endif

else
$(bin)ZdZdPlotting_dependencies.make : $(ZdZdPlotting_entries_cxx_dependencies)

$(bin)ZdZdPlotting_dependencies.make : $(src)components/ZdZdPlotting_entries.cxx

$(bin)$(binobj)ZdZdPlotting_entries.o : $(ZdZdPlotting_entries_cxx_dependencies)
	$(cpp_echo) $(src)components/ZdZdPlotting_entries.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(ZdZdPlotting_pp_cppflags) $(lib_ZdZdPlotting_pp_cppflags) $(ZdZdPlotting_entries_pp_cppflags) $(use_cppflags) $(ZdZdPlotting_cppflags) $(lib_ZdZdPlotting_cppflags) $(ZdZdPlotting_entries_cppflags) $(ZdZdPlotting_entries_cxx_cppflags) -I../src/components $(src)components/ZdZdPlotting_entries.cxx

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: ZdZdPlottingclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(ZdZdPlotting.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

ZdZdPlottingclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library ZdZdPlotting
	-$(cleanup_silent) cd $(bin) && \rm -f $(library_prefix)ZdZdPlotting$(library_suffix).a $(library_prefix)ZdZdPlotting$(library_suffix).$(shlibsuffix) ZdZdPlotting.stamp ZdZdPlotting.shstamp
#-- end of cleanup_library ---------------
