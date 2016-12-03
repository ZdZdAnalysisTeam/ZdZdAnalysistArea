#-- start of make_header -----------------

#====================================
#  Library GeneralCamTools
#
#   Generated Sat Nov 19 20:07:07 2016  by diboye
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_GeneralCamTools_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_GeneralCamTools_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_GeneralCamTools

GeneralCamTools_tag = $(tag)

#cmt_local_tagfile_GeneralCamTools = $(GeneralCamTools_tag)_GeneralCamTools.make
cmt_local_tagfile_GeneralCamTools = $(bin)$(GeneralCamTools_tag)_GeneralCamTools.make

else

tags      = $(tag),$(CMTEXTRATAGS)

GeneralCamTools_tag = $(tag)

#cmt_local_tagfile_GeneralCamTools = $(GeneralCamTools_tag).make
cmt_local_tagfile_GeneralCamTools = $(bin)$(GeneralCamTools_tag).make

endif

include $(cmt_local_tagfile_GeneralCamTools)
#-include $(cmt_local_tagfile_GeneralCamTools)

ifdef cmt_GeneralCamTools_has_target_tag

cmt_final_setup_GeneralCamTools = $(bin)setup_GeneralCamTools.make
cmt_dependencies_in_GeneralCamTools = $(bin)dependencies_GeneralCamTools.in
#cmt_final_setup_GeneralCamTools = $(bin)GeneralCamTools_GeneralCamToolssetup.make
cmt_local_GeneralCamTools_makefile = $(bin)GeneralCamTools.make

else

cmt_final_setup_GeneralCamTools = $(bin)setup.make
cmt_dependencies_in_GeneralCamTools = $(bin)dependencies.in
#cmt_final_setup_GeneralCamTools = $(bin)GeneralCamToolssetup.make
cmt_local_GeneralCamTools_makefile = $(bin)GeneralCamTools.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)GeneralCamToolssetup.make

#GeneralCamTools :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'GeneralCamTools'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = GeneralCamTools/
#GeneralCamTools::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

GeneralCamToolslibname   = $(bin)$(library_prefix)GeneralCamTools$(library_suffix)
GeneralCamToolslib       = $(GeneralCamToolslibname).a
GeneralCamToolsstamp     = $(bin)GeneralCamTools.stamp
GeneralCamToolsshstamp   = $(bin)GeneralCamTools.shstamp

GeneralCamTools :: dirs  GeneralCamToolsLIB
	$(echo) "GeneralCamTools ok"

#-- end of libary_header ----------------
#-- start of library_no_static ------

#GeneralCamToolsLIB :: $(GeneralCamToolslib) $(GeneralCamToolsshstamp)
GeneralCamToolsLIB :: $(GeneralCamToolsshstamp)
	$(echo) "GeneralCamTools : library ok"

$(GeneralCamToolslib) :: $(bin)xAODLumiSvc.o $(bin)ChannelInfoTool.o $(bin)GeneralCamTools_load.o $(bin)GeneralCamTools_entries.o
	$(lib_echo) "static library $@"
	$(lib_silent) cd $(bin); \
	  $(ar) $(GeneralCamToolslib) $?
	$(lib_silent) $(ranlib) $(GeneralCamToolslib)
	$(lib_silent) cat /dev/null >$(GeneralCamToolsstamp)

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

$(GeneralCamToolslibname).$(shlibsuffix) :: $(bin)xAODLumiSvc.o $(bin)ChannelInfoTool.o $(bin)GeneralCamTools_load.o $(bin)GeneralCamTools_entries.o $(use_requirements) $(GeneralCamToolsstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) $(shlibbuilder) $(shlibflags) -o $@ $(bin)xAODLumiSvc.o $(bin)ChannelInfoTool.o $(bin)GeneralCamTools_load.o $(bin)GeneralCamTools_entries.o $(GeneralCamTools_shlibflags)
	$(lib_silent) cat /dev/null >$(GeneralCamToolsstamp) && \
	  cat /dev/null >$(GeneralCamToolsshstamp)

$(GeneralCamToolsshstamp) :: $(GeneralCamToolslibname).$(shlibsuffix)
	$(lib_silent) if test -f $(GeneralCamToolslibname).$(shlibsuffix) ; then \
	  cat /dev/null >$(GeneralCamToolsstamp) && \
	  cat /dev/null >$(GeneralCamToolsshstamp) ; fi

GeneralCamToolsclean ::
	$(cleanup_echo) objects GeneralCamTools
	$(cleanup_silent) /bin/rm -f $(bin)xAODLumiSvc.o $(bin)ChannelInfoTool.o $(bin)GeneralCamTools_load.o $(bin)GeneralCamTools_entries.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)xAODLumiSvc.o $(bin)ChannelInfoTool.o $(bin)GeneralCamTools_load.o $(bin)GeneralCamTools_entries.o) $(patsubst %.o,%.dep,$(bin)xAODLumiSvc.o $(bin)ChannelInfoTool.o $(bin)GeneralCamTools_load.o $(bin)GeneralCamTools_entries.o) $(patsubst %.o,%.d.stamp,$(bin)xAODLumiSvc.o $(bin)ChannelInfoTool.o $(bin)GeneralCamTools_load.o $(bin)GeneralCamTools_entries.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf GeneralCamTools_deps GeneralCamTools_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
GeneralCamToolsinstallname = $(library_prefix)GeneralCamTools$(library_suffix).$(shlibsuffix)

GeneralCamTools :: GeneralCamToolsinstall ;

install :: GeneralCamToolsinstall ;

GeneralCamToolsinstall :: $(install_dir)/$(GeneralCamToolsinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(GeneralCamToolsinstallname) :: $(bin)$(GeneralCamToolsinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(GeneralCamToolsinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##GeneralCamToolsclean :: GeneralCamToolsuninstall

uninstall :: GeneralCamToolsuninstall ;

GeneralCamToolsuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(GeneralCamToolsinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of library_no_static ------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),GeneralCamToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)xAODLumiSvc.d

$(bin)$(binobj)xAODLumiSvc.d :

$(bin)$(binobj)xAODLumiSvc.o : $(cmt_final_setup_GeneralCamTools)

$(bin)$(binobj)xAODLumiSvc.o : $(src)xAODLumiSvc.cxx
	$(cpp_echo) $(src)xAODLumiSvc.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(GeneralCamTools_pp_cppflags) $(lib_GeneralCamTools_pp_cppflags) $(xAODLumiSvc_pp_cppflags) $(use_cppflags) $(GeneralCamTools_cppflags) $(lib_GeneralCamTools_cppflags) $(xAODLumiSvc_cppflags) $(xAODLumiSvc_cxx_cppflags)  $(src)xAODLumiSvc.cxx
endif
endif

else
$(bin)GeneralCamTools_dependencies.make : $(xAODLumiSvc_cxx_dependencies)

$(bin)GeneralCamTools_dependencies.make : $(src)xAODLumiSvc.cxx

$(bin)$(binobj)xAODLumiSvc.o : $(xAODLumiSvc_cxx_dependencies)
	$(cpp_echo) $(src)xAODLumiSvc.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(GeneralCamTools_pp_cppflags) $(lib_GeneralCamTools_pp_cppflags) $(xAODLumiSvc_pp_cppflags) $(use_cppflags) $(GeneralCamTools_cppflags) $(lib_GeneralCamTools_cppflags) $(xAODLumiSvc_cppflags) $(xAODLumiSvc_cxx_cppflags)  $(src)xAODLumiSvc.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),GeneralCamToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ChannelInfoTool.d

$(bin)$(binobj)ChannelInfoTool.d :

$(bin)$(binobj)ChannelInfoTool.o : $(cmt_final_setup_GeneralCamTools)

$(bin)$(binobj)ChannelInfoTool.o : $(src)ChannelInfoTool.cxx
	$(cpp_echo) $(src)ChannelInfoTool.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(GeneralCamTools_pp_cppflags) $(lib_GeneralCamTools_pp_cppflags) $(ChannelInfoTool_pp_cppflags) $(use_cppflags) $(GeneralCamTools_cppflags) $(lib_GeneralCamTools_cppflags) $(ChannelInfoTool_cppflags) $(ChannelInfoTool_cxx_cppflags)  $(src)ChannelInfoTool.cxx
endif
endif

else
$(bin)GeneralCamTools_dependencies.make : $(ChannelInfoTool_cxx_dependencies)

$(bin)GeneralCamTools_dependencies.make : $(src)ChannelInfoTool.cxx

$(bin)$(binobj)ChannelInfoTool.o : $(ChannelInfoTool_cxx_dependencies)
	$(cpp_echo) $(src)ChannelInfoTool.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(GeneralCamTools_pp_cppflags) $(lib_GeneralCamTools_pp_cppflags) $(ChannelInfoTool_pp_cppflags) $(use_cppflags) $(GeneralCamTools_cppflags) $(lib_GeneralCamTools_cppflags) $(ChannelInfoTool_cppflags) $(ChannelInfoTool_cxx_cppflags)  $(src)ChannelInfoTool.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),GeneralCamToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)GeneralCamTools_load.d

$(bin)$(binobj)GeneralCamTools_load.d :

$(bin)$(binobj)GeneralCamTools_load.o : $(cmt_final_setup_GeneralCamTools)

$(bin)$(binobj)GeneralCamTools_load.o : $(src)components/GeneralCamTools_load.cxx
	$(cpp_echo) $(src)components/GeneralCamTools_load.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(GeneralCamTools_pp_cppflags) $(lib_GeneralCamTools_pp_cppflags) $(GeneralCamTools_load_pp_cppflags) $(use_cppflags) $(GeneralCamTools_cppflags) $(lib_GeneralCamTools_cppflags) $(GeneralCamTools_load_cppflags) $(GeneralCamTools_load_cxx_cppflags) -I../src/components $(src)components/GeneralCamTools_load.cxx
endif
endif

else
$(bin)GeneralCamTools_dependencies.make : $(GeneralCamTools_load_cxx_dependencies)

$(bin)GeneralCamTools_dependencies.make : $(src)components/GeneralCamTools_load.cxx

$(bin)$(binobj)GeneralCamTools_load.o : $(GeneralCamTools_load_cxx_dependencies)
	$(cpp_echo) $(src)components/GeneralCamTools_load.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(GeneralCamTools_pp_cppflags) $(lib_GeneralCamTools_pp_cppflags) $(GeneralCamTools_load_pp_cppflags) $(use_cppflags) $(GeneralCamTools_cppflags) $(lib_GeneralCamTools_cppflags) $(GeneralCamTools_load_cppflags) $(GeneralCamTools_load_cxx_cppflags) -I../src/components $(src)components/GeneralCamTools_load.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),GeneralCamToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)GeneralCamTools_entries.d

$(bin)$(binobj)GeneralCamTools_entries.d :

$(bin)$(binobj)GeneralCamTools_entries.o : $(cmt_final_setup_GeneralCamTools)

$(bin)$(binobj)GeneralCamTools_entries.o : $(src)components/GeneralCamTools_entries.cxx
	$(cpp_echo) $(src)components/GeneralCamTools_entries.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(GeneralCamTools_pp_cppflags) $(lib_GeneralCamTools_pp_cppflags) $(GeneralCamTools_entries_pp_cppflags) $(use_cppflags) $(GeneralCamTools_cppflags) $(lib_GeneralCamTools_cppflags) $(GeneralCamTools_entries_cppflags) $(GeneralCamTools_entries_cxx_cppflags) -I../src/components $(src)components/GeneralCamTools_entries.cxx
endif
endif

else
$(bin)GeneralCamTools_dependencies.make : $(GeneralCamTools_entries_cxx_dependencies)

$(bin)GeneralCamTools_dependencies.make : $(src)components/GeneralCamTools_entries.cxx

$(bin)$(binobj)GeneralCamTools_entries.o : $(GeneralCamTools_entries_cxx_dependencies)
	$(cpp_echo) $(src)components/GeneralCamTools_entries.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(GeneralCamTools_pp_cppflags) $(lib_GeneralCamTools_pp_cppflags) $(GeneralCamTools_entries_pp_cppflags) $(use_cppflags) $(GeneralCamTools_cppflags) $(lib_GeneralCamTools_cppflags) $(GeneralCamTools_entries_cppflags) $(GeneralCamTools_entries_cxx_cppflags) -I../src/components $(src)components/GeneralCamTools_entries.cxx

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: GeneralCamToolsclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(GeneralCamTools.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

GeneralCamToolsclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library GeneralCamTools
	-$(cleanup_silent) cd $(bin) && \rm -f $(library_prefix)GeneralCamTools$(library_suffix).a $(library_prefix)GeneralCamTools$(library_suffix).$(shlibsuffix) GeneralCamTools.stamp GeneralCamTools.shstamp
#-- end of cleanup_library ---------------
