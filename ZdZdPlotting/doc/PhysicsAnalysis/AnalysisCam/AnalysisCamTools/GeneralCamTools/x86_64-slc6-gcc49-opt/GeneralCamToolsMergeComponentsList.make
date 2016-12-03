#-- start of make_header -----------------

#====================================
#  Document GeneralCamToolsMergeComponentsList
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

cmt_GeneralCamToolsMergeComponentsList_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_GeneralCamToolsMergeComponentsList_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_GeneralCamToolsMergeComponentsList

GeneralCamTools_tag = $(tag)

#cmt_local_tagfile_GeneralCamToolsMergeComponentsList = $(GeneralCamTools_tag)_GeneralCamToolsMergeComponentsList.make
cmt_local_tagfile_GeneralCamToolsMergeComponentsList = $(bin)$(GeneralCamTools_tag)_GeneralCamToolsMergeComponentsList.make

else

tags      = $(tag),$(CMTEXTRATAGS)

GeneralCamTools_tag = $(tag)

#cmt_local_tagfile_GeneralCamToolsMergeComponentsList = $(GeneralCamTools_tag).make
cmt_local_tagfile_GeneralCamToolsMergeComponentsList = $(bin)$(GeneralCamTools_tag).make

endif

include $(cmt_local_tagfile_GeneralCamToolsMergeComponentsList)
#-include $(cmt_local_tagfile_GeneralCamToolsMergeComponentsList)

ifdef cmt_GeneralCamToolsMergeComponentsList_has_target_tag

cmt_final_setup_GeneralCamToolsMergeComponentsList = $(bin)setup_GeneralCamToolsMergeComponentsList.make
cmt_dependencies_in_GeneralCamToolsMergeComponentsList = $(bin)dependencies_GeneralCamToolsMergeComponentsList.in
#cmt_final_setup_GeneralCamToolsMergeComponentsList = $(bin)GeneralCamTools_GeneralCamToolsMergeComponentsListsetup.make
cmt_local_GeneralCamToolsMergeComponentsList_makefile = $(bin)GeneralCamToolsMergeComponentsList.make

else

cmt_final_setup_GeneralCamToolsMergeComponentsList = $(bin)setup.make
cmt_dependencies_in_GeneralCamToolsMergeComponentsList = $(bin)dependencies.in
#cmt_final_setup_GeneralCamToolsMergeComponentsList = $(bin)GeneralCamToolssetup.make
cmt_local_GeneralCamToolsMergeComponentsList_makefile = $(bin)GeneralCamToolsMergeComponentsList.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)GeneralCamToolssetup.make

#GeneralCamToolsMergeComponentsList :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'GeneralCamToolsMergeComponentsList'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = GeneralCamToolsMergeComponentsList/
#GeneralCamToolsMergeComponentsList::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
# File: cmt/fragments/merge_componentslist_header
# Author: Sebastien Binet (binet@cern.ch)

# Makefile fragment to merge a <library>.components file into a single
# <project>.components file in the (lib) install area
# If no InstallArea is present the fragment is dummy


.PHONY: GeneralCamToolsMergeComponentsList GeneralCamToolsMergeComponentsListclean

# default is already '#'
#genmap_comment_char := "'#'"

componentsListRef    := ../$(tag)/GeneralCamTools.components

ifdef CMTINSTALLAREA
componentsListDir    := ${CMTINSTALLAREA}/$(tag)/lib
mergedComponentsList := $(componentsListDir)/$(project).components
stampComponentsList  := $(componentsListRef).stamp
else
componentsListDir    := ../$(tag)
mergedComponentsList :=
stampComponentsList  :=
endif

GeneralCamToolsMergeComponentsList :: $(stampComponentsList) $(mergedComponentsList)
	@:

.NOTPARALLEL : $(stampComponentsList) $(mergedComponentsList)

$(stampComponentsList) $(mergedComponentsList) :: $(componentsListRef)
	@echo "Running merge_componentslist  GeneralCamToolsMergeComponentsList"
	$(merge_componentslist_cmd) --do-merge \
         --input-file $(componentsListRef) --merged-file $(mergedComponentsList)

GeneralCamToolsMergeComponentsListclean ::
	$(cleanup_silent) $(merge_componentslist_cmd) --un-merge \
         --input-file $(componentsListRef) --merged-file $(mergedComponentsList) ;
	$(cleanup_silent) $(remove_command) $(stampComponentsList)
libGeneralCamTools_so_dependencies = ../x86_64-slc6-gcc49-opt/libGeneralCamTools.so
#-- start of cleanup_header --------------

clean :: GeneralCamToolsMergeComponentsListclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(GeneralCamToolsMergeComponentsList.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

GeneralCamToolsMergeComponentsListclean ::
#-- end of cleanup_header ---------------
