#-- start of make_header -----------------

#====================================
#  Document GeneralCamToolsComponentsList
#
#   Generated Sat Nov 19 20:07:23 2016  by diboye
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_GeneralCamToolsComponentsList_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_GeneralCamToolsComponentsList_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_GeneralCamToolsComponentsList

GeneralCamTools_tag = $(tag)

#cmt_local_tagfile_GeneralCamToolsComponentsList = $(GeneralCamTools_tag)_GeneralCamToolsComponentsList.make
cmt_local_tagfile_GeneralCamToolsComponentsList = $(bin)$(GeneralCamTools_tag)_GeneralCamToolsComponentsList.make

else

tags      = $(tag),$(CMTEXTRATAGS)

GeneralCamTools_tag = $(tag)

#cmt_local_tagfile_GeneralCamToolsComponentsList = $(GeneralCamTools_tag).make
cmt_local_tagfile_GeneralCamToolsComponentsList = $(bin)$(GeneralCamTools_tag).make

endif

include $(cmt_local_tagfile_GeneralCamToolsComponentsList)
#-include $(cmt_local_tagfile_GeneralCamToolsComponentsList)

ifdef cmt_GeneralCamToolsComponentsList_has_target_tag

cmt_final_setup_GeneralCamToolsComponentsList = $(bin)setup_GeneralCamToolsComponentsList.make
cmt_dependencies_in_GeneralCamToolsComponentsList = $(bin)dependencies_GeneralCamToolsComponentsList.in
#cmt_final_setup_GeneralCamToolsComponentsList = $(bin)GeneralCamTools_GeneralCamToolsComponentsListsetup.make
cmt_local_GeneralCamToolsComponentsList_makefile = $(bin)GeneralCamToolsComponentsList.make

else

cmt_final_setup_GeneralCamToolsComponentsList = $(bin)setup.make
cmt_dependencies_in_GeneralCamToolsComponentsList = $(bin)dependencies.in
#cmt_final_setup_GeneralCamToolsComponentsList = $(bin)GeneralCamToolssetup.make
cmt_local_GeneralCamToolsComponentsList_makefile = $(bin)GeneralCamToolsComponentsList.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)GeneralCamToolssetup.make

#GeneralCamToolsComponentsList :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'GeneralCamToolsComponentsList'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = GeneralCamToolsComponentsList/
#GeneralCamToolsComponentsList::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
##
componentslistfile = GeneralCamTools.components
COMPONENTSLIST_DIR = ../$(tag)
fulllibname = libGeneralCamTools.$(shlibsuffix)

GeneralCamToolsComponentsList :: ${COMPONENTSLIST_DIR}/$(componentslistfile)
	@:

${COMPONENTSLIST_DIR}/$(componentslistfile) :: $(bin)$(fulllibname)
	@echo 'Generating componentslist file for $(fulllibname)'
	cd ../$(tag);$(listcomponents_cmd) --output ${COMPONENTSLIST_DIR}/$(componentslistfile) $(fulllibname)

install :: GeneralCamToolsComponentsListinstall
GeneralCamToolsComponentsListinstall :: GeneralCamToolsComponentsList

uninstall :: GeneralCamToolsComponentsListuninstall
GeneralCamToolsComponentsListuninstall :: GeneralCamToolsComponentsListclean

GeneralCamToolsComponentsListclean ::
	@echo 'Deleting $(componentslistfile)'
	@rm -f ${COMPONENTSLIST_DIR}/$(componentslistfile)

#-- start of cleanup_header --------------

clean :: GeneralCamToolsComponentsListclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(GeneralCamToolsComponentsList.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

GeneralCamToolsComponentsListclean ::
#-- end of cleanup_header ---------------
