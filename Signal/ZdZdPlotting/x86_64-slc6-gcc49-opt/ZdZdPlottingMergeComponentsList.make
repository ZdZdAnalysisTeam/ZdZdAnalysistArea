#-- start of make_header -----------------

#====================================
#  Document ZdZdPlottingMergeComponentsList
#
#   Generated Fri Dec  2 18:47:31 2016  by diboye
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_ZdZdPlottingMergeComponentsList_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_ZdZdPlottingMergeComponentsList_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_ZdZdPlottingMergeComponentsList

ZdZdPlotting_tag = $(tag)

#cmt_local_tagfile_ZdZdPlottingMergeComponentsList = $(ZdZdPlotting_tag)_ZdZdPlottingMergeComponentsList.make
cmt_local_tagfile_ZdZdPlottingMergeComponentsList = $(bin)$(ZdZdPlotting_tag)_ZdZdPlottingMergeComponentsList.make

else

tags      = $(tag),$(CMTEXTRATAGS)

ZdZdPlotting_tag = $(tag)

#cmt_local_tagfile_ZdZdPlottingMergeComponentsList = $(ZdZdPlotting_tag).make
cmt_local_tagfile_ZdZdPlottingMergeComponentsList = $(bin)$(ZdZdPlotting_tag).make

endif

include $(cmt_local_tagfile_ZdZdPlottingMergeComponentsList)
#-include $(cmt_local_tagfile_ZdZdPlottingMergeComponentsList)

ifdef cmt_ZdZdPlottingMergeComponentsList_has_target_tag

cmt_final_setup_ZdZdPlottingMergeComponentsList = $(bin)setup_ZdZdPlottingMergeComponentsList.make
cmt_dependencies_in_ZdZdPlottingMergeComponentsList = $(bin)dependencies_ZdZdPlottingMergeComponentsList.in
#cmt_final_setup_ZdZdPlottingMergeComponentsList = $(bin)ZdZdPlotting_ZdZdPlottingMergeComponentsListsetup.make
cmt_local_ZdZdPlottingMergeComponentsList_makefile = $(bin)ZdZdPlottingMergeComponentsList.make

else

cmt_final_setup_ZdZdPlottingMergeComponentsList = $(bin)setup.make
cmt_dependencies_in_ZdZdPlottingMergeComponentsList = $(bin)dependencies.in
#cmt_final_setup_ZdZdPlottingMergeComponentsList = $(bin)ZdZdPlottingsetup.make
cmt_local_ZdZdPlottingMergeComponentsList_makefile = $(bin)ZdZdPlottingMergeComponentsList.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)ZdZdPlottingsetup.make

#ZdZdPlottingMergeComponentsList :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'ZdZdPlottingMergeComponentsList'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = ZdZdPlottingMergeComponentsList/
#ZdZdPlottingMergeComponentsList::
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


.PHONY: ZdZdPlottingMergeComponentsList ZdZdPlottingMergeComponentsListclean

# default is already '#'
#genmap_comment_char := "'#'"

componentsListRef    := ../$(tag)/ZdZdPlotting.components

ifdef CMTINSTALLAREA
componentsListDir    := ${CMTINSTALLAREA}/$(tag)/lib
mergedComponentsList := $(componentsListDir)/$(project).components
stampComponentsList  := $(componentsListRef).stamp
else
componentsListDir    := ../$(tag)
mergedComponentsList :=
stampComponentsList  :=
endif

ZdZdPlottingMergeComponentsList :: $(stampComponentsList) $(mergedComponentsList)
	@:

.NOTPARALLEL : $(stampComponentsList) $(mergedComponentsList)

$(stampComponentsList) $(mergedComponentsList) :: $(componentsListRef)
	@echo "Running merge_componentslist  ZdZdPlottingMergeComponentsList"
	$(merge_componentslist_cmd) --do-merge \
         --input-file $(componentsListRef) --merged-file $(mergedComponentsList)

ZdZdPlottingMergeComponentsListclean ::
	$(cleanup_silent) $(merge_componentslist_cmd) --un-merge \
         --input-file $(componentsListRef) --merged-file $(mergedComponentsList) ;
	$(cleanup_silent) $(remove_command) $(stampComponentsList)
libZdZdPlotting_so_dependencies = ../x86_64-slc6-gcc49-opt/libZdZdPlotting.so
#-- start of cleanup_header --------------

clean :: ZdZdPlottingMergeComponentsListclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(ZdZdPlottingMergeComponentsList.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

ZdZdPlottingMergeComponentsListclean ::
#-- end of cleanup_header ---------------
