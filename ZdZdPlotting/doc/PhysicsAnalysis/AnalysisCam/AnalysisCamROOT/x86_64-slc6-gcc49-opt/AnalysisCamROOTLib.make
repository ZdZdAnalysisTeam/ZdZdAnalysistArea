#-- start of make_header -----------------

#====================================
#  Library AnalysisCamROOTLib
#
#   Generated Sat Nov 19 20:05:52 2016  by diboye
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_AnalysisCamROOTLib_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_AnalysisCamROOTLib_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_AnalysisCamROOTLib

AnalysisCamROOT_tag = $(tag)

#cmt_local_tagfile_AnalysisCamROOTLib = $(AnalysisCamROOT_tag)_AnalysisCamROOTLib.make
cmt_local_tagfile_AnalysisCamROOTLib = $(bin)$(AnalysisCamROOT_tag)_AnalysisCamROOTLib.make

else

tags      = $(tag),$(CMTEXTRATAGS)

AnalysisCamROOT_tag = $(tag)

#cmt_local_tagfile_AnalysisCamROOTLib = $(AnalysisCamROOT_tag).make
cmt_local_tagfile_AnalysisCamROOTLib = $(bin)$(AnalysisCamROOT_tag).make

endif

include $(cmt_local_tagfile_AnalysisCamROOTLib)
#-include $(cmt_local_tagfile_AnalysisCamROOTLib)

ifdef cmt_AnalysisCamROOTLib_has_target_tag

cmt_final_setup_AnalysisCamROOTLib = $(bin)setup_AnalysisCamROOTLib.make
cmt_dependencies_in_AnalysisCamROOTLib = $(bin)dependencies_AnalysisCamROOTLib.in
#cmt_final_setup_AnalysisCamROOTLib = $(bin)AnalysisCamROOT_AnalysisCamROOTLibsetup.make
cmt_local_AnalysisCamROOTLib_makefile = $(bin)AnalysisCamROOTLib.make

else

cmt_final_setup_AnalysisCamROOTLib = $(bin)setup.make
cmt_dependencies_in_AnalysisCamROOTLib = $(bin)dependencies.in
#cmt_final_setup_AnalysisCamROOTLib = $(bin)AnalysisCamROOTsetup.make
cmt_local_AnalysisCamROOTLib_makefile = $(bin)AnalysisCamROOTLib.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)AnalysisCamROOTsetup.make

#AnalysisCamROOTLib :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'AnalysisCamROOTLib'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = AnalysisCamROOTLib/
#AnalysisCamROOTLib::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

AnalysisCamROOTLiblibname   = $(bin)$(library_prefix)AnalysisCamROOTLib$(library_suffix)
AnalysisCamROOTLiblib       = $(AnalysisCamROOTLiblibname).a
AnalysisCamROOTLibstamp     = $(bin)AnalysisCamROOTLib.stamp
AnalysisCamROOTLibshstamp   = $(bin)AnalysisCamROOTLib.shstamp

AnalysisCamROOTLib :: dirs  AnalysisCamROOTLibLIB
	$(echo) "AnalysisCamROOTLib ok"

#-- end of libary_header ----------------
#-- start of library_no_static ------

#AnalysisCamROOTLibLIB :: $(AnalysisCamROOTLiblib) $(AnalysisCamROOTLibshstamp)
AnalysisCamROOTLibLIB :: $(AnalysisCamROOTLibshstamp)
	$(echo) "AnalysisCamROOTLib : library ok"

$(AnalysisCamROOTLiblib) :: $(bin)TChannelInfo.o $(bin)AnalysisCamROOTLibDict.o
	$(lib_echo) "static library $@"
	$(lib_silent) cd $(bin); \
	  $(ar) $(AnalysisCamROOTLiblib) $?
	$(lib_silent) $(ranlib) $(AnalysisCamROOTLiblib)
	$(lib_silent) cat /dev/null >$(AnalysisCamROOTLibstamp)

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

$(AnalysisCamROOTLiblibname).$(shlibsuffix) :: $(bin)TChannelInfo.o $(bin)AnalysisCamROOTLibDict.o $(use_requirements) $(AnalysisCamROOTLibstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) $(shlibbuilder) $(shlibflags) -o $@ $(bin)TChannelInfo.o $(bin)AnalysisCamROOTLibDict.o $(AnalysisCamROOTLib_shlibflags)
	$(lib_silent) cat /dev/null >$(AnalysisCamROOTLibstamp) && \
	  cat /dev/null >$(AnalysisCamROOTLibshstamp)

$(AnalysisCamROOTLibshstamp) :: $(AnalysisCamROOTLiblibname).$(shlibsuffix)
	$(lib_silent) if test -f $(AnalysisCamROOTLiblibname).$(shlibsuffix) ; then \
	  cat /dev/null >$(AnalysisCamROOTLibstamp) && \
	  cat /dev/null >$(AnalysisCamROOTLibshstamp) ; fi

AnalysisCamROOTLibclean ::
	$(cleanup_echo) objects AnalysisCamROOTLib
	$(cleanup_silent) /bin/rm -f $(bin)TChannelInfo.o $(bin)AnalysisCamROOTLibDict.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)TChannelInfo.o $(bin)AnalysisCamROOTLibDict.o) $(patsubst %.o,%.dep,$(bin)TChannelInfo.o $(bin)AnalysisCamROOTLibDict.o) $(patsubst %.o,%.d.stamp,$(bin)TChannelInfo.o $(bin)AnalysisCamROOTLibDict.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf AnalysisCamROOTLib_deps AnalysisCamROOTLib_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
AnalysisCamROOTLibinstallname = $(library_prefix)AnalysisCamROOTLib$(library_suffix).$(shlibsuffix)

AnalysisCamROOTLib :: AnalysisCamROOTLibinstall ;

install :: AnalysisCamROOTLibinstall ;

AnalysisCamROOTLibinstall :: $(install_dir)/$(AnalysisCamROOTLibinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(AnalysisCamROOTLibinstallname) :: $(bin)$(AnalysisCamROOTLibinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(AnalysisCamROOTLibinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##AnalysisCamROOTLibclean :: AnalysisCamROOTLibuninstall

uninstall :: AnalysisCamROOTLibuninstall ;

AnalysisCamROOTLibuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(AnalysisCamROOTLibinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of library_no_static ------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),AnalysisCamROOTLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TChannelInfo.d

$(bin)$(binobj)TChannelInfo.d :

$(bin)$(binobj)TChannelInfo.o : $(cmt_final_setup_AnalysisCamROOTLib)

$(bin)$(binobj)TChannelInfo.o : $(src)TChannelInfo.cxx
	$(cpp_echo) $(src)TChannelInfo.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(AnalysisCamROOTLib_pp_cppflags) $(lib_AnalysisCamROOTLib_pp_cppflags) $(TChannelInfo_pp_cppflags) $(use_cppflags) $(AnalysisCamROOTLib_cppflags) $(lib_AnalysisCamROOTLib_cppflags) $(TChannelInfo_cppflags) $(TChannelInfo_cxx_cppflags)  $(src)TChannelInfo.cxx
endif
endif

else
$(bin)AnalysisCamROOTLib_dependencies.make : $(TChannelInfo_cxx_dependencies)

$(bin)AnalysisCamROOTLib_dependencies.make : $(src)TChannelInfo.cxx

$(bin)$(binobj)TChannelInfo.o : $(TChannelInfo_cxx_dependencies)
	$(cpp_echo) $(src)TChannelInfo.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(AnalysisCamROOTLib_pp_cppflags) $(lib_AnalysisCamROOTLib_pp_cppflags) $(TChannelInfo_pp_cppflags) $(use_cppflags) $(AnalysisCamROOTLib_cppflags) $(lib_AnalysisCamROOTLib_cppflags) $(TChannelInfo_cppflags) $(TChannelInfo_cxx_cppflags)  $(src)TChannelInfo.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),AnalysisCamROOTLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)AnalysisCamROOTLibDict.d

$(bin)$(binobj)AnalysisCamROOTLibDict.d :

$(bin)$(binobj)AnalysisCamROOTLibDict.o : $(cmt_final_setup_AnalysisCamROOTLib)

$(bin)$(binobj)AnalysisCamROOTLibDict.o : ../x86_64-slc6-gcc49-opt/dict/AnalysisCamROOTLibDict.cxx
	$(cpp_echo) ../x86_64-slc6-gcc49-opt/dict/AnalysisCamROOTLibDict.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(AnalysisCamROOTLib_pp_cppflags) $(lib_AnalysisCamROOTLib_pp_cppflags) $(AnalysisCamROOTLibDict_pp_cppflags) $(use_cppflags) $(AnalysisCamROOTLib_cppflags) $(lib_AnalysisCamROOTLib_cppflags) $(AnalysisCamROOTLibDict_cppflags) $(AnalysisCamROOTLibDict_cxx_cppflags) -I../x86_64-slc6-gcc49-opt/dict ../x86_64-slc6-gcc49-opt/dict/AnalysisCamROOTLibDict.cxx
endif
endif

else
$(bin)AnalysisCamROOTLib_dependencies.make : $(AnalysisCamROOTLibDict_cxx_dependencies)

$(bin)AnalysisCamROOTLib_dependencies.make : ../x86_64-slc6-gcc49-opt/dict/AnalysisCamROOTLibDict.cxx

$(bin)$(binobj)AnalysisCamROOTLibDict.o : $(AnalysisCamROOTLibDict_cxx_dependencies)
	$(cpp_echo) ../x86_64-slc6-gcc49-opt/dict/AnalysisCamROOTLibDict.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(AnalysisCamROOTLib_pp_cppflags) $(lib_AnalysisCamROOTLib_pp_cppflags) $(AnalysisCamROOTLibDict_pp_cppflags) $(use_cppflags) $(AnalysisCamROOTLib_cppflags) $(lib_AnalysisCamROOTLib_cppflags) $(AnalysisCamROOTLibDict_cppflags) $(AnalysisCamROOTLibDict_cxx_cppflags) -I../x86_64-slc6-gcc49-opt/dict ../x86_64-slc6-gcc49-opt/dict/AnalysisCamROOTLibDict.cxx

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: AnalysisCamROOTLibclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(AnalysisCamROOTLib.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

AnalysisCamROOTLibclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library AnalysisCamROOTLib
	-$(cleanup_silent) cd $(bin) && \rm -f $(library_prefix)AnalysisCamROOTLib$(library_suffix).a $(library_prefix)AnalysisCamROOTLib$(library_suffix).$(shlibsuffix) AnalysisCamROOTLib.stamp AnalysisCamROOTLib.shstamp
#-- end of cleanup_library ---------------
