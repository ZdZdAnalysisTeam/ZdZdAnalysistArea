#-- start of make_header -----------------

#====================================
#  Document AnalysisCamROOTLib_MergeMap
#
#   Generated Sat Nov 19 20:05:57 2016  by diboye
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_AnalysisCamROOTLib_MergeMap_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_AnalysisCamROOTLib_MergeMap_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_AnalysisCamROOTLib_MergeMap

AnalysisCamROOT_tag = $(tag)

#cmt_local_tagfile_AnalysisCamROOTLib_MergeMap = $(AnalysisCamROOT_tag)_AnalysisCamROOTLib_MergeMap.make
cmt_local_tagfile_AnalysisCamROOTLib_MergeMap = $(bin)$(AnalysisCamROOT_tag)_AnalysisCamROOTLib_MergeMap.make

else

tags      = $(tag),$(CMTEXTRATAGS)

AnalysisCamROOT_tag = $(tag)

#cmt_local_tagfile_AnalysisCamROOTLib_MergeMap = $(AnalysisCamROOT_tag).make
cmt_local_tagfile_AnalysisCamROOTLib_MergeMap = $(bin)$(AnalysisCamROOT_tag).make

endif

include $(cmt_local_tagfile_AnalysisCamROOTLib_MergeMap)
#-include $(cmt_local_tagfile_AnalysisCamROOTLib_MergeMap)

ifdef cmt_AnalysisCamROOTLib_MergeMap_has_target_tag

cmt_final_setup_AnalysisCamROOTLib_MergeMap = $(bin)setup_AnalysisCamROOTLib_MergeMap.make
cmt_dependencies_in_AnalysisCamROOTLib_MergeMap = $(bin)dependencies_AnalysisCamROOTLib_MergeMap.in
#cmt_final_setup_AnalysisCamROOTLib_MergeMap = $(bin)AnalysisCamROOT_AnalysisCamROOTLib_MergeMapsetup.make
cmt_local_AnalysisCamROOTLib_MergeMap_makefile = $(bin)AnalysisCamROOTLib_MergeMap.make

else

cmt_final_setup_AnalysisCamROOTLib_MergeMap = $(bin)setup.make
cmt_dependencies_in_AnalysisCamROOTLib_MergeMap = $(bin)dependencies.in
#cmt_final_setup_AnalysisCamROOTLib_MergeMap = $(bin)AnalysisCamROOTsetup.make
cmt_local_AnalysisCamROOTLib_MergeMap_makefile = $(bin)AnalysisCamROOTLib_MergeMap.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)AnalysisCamROOTsetup.make

#AnalysisCamROOTLib_MergeMap :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'AnalysisCamROOTLib_MergeMap'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = AnalysisCamROOTLib_MergeMap/
#AnalysisCamROOTLib_MergeMap::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
# File: cmt/fragments/merge_rootmap_header
# Author: Sebastien Binet (binet@cern.ch)

# Makefile fragment to merge a <library>.rootmap file into a single
# <project>.rootmap file in the (lib) install area
# If no InstallArea is present the fragment is dummy


.PHONY: AnalysisCamROOTLib_MergeMap AnalysisCamROOTLib_MergeMapclean

# default is already '#'
#genmap_comment_char := "'#'"

rootMapRef    := ../$(tag)/AnalysisCamROOTLib.rootmap

ifdef CMTINSTALLAREA
rootMapDir    := ${CMTINSTALLAREA}/$(tag)/lib
mergedRootMap := $(rootMapDir)/$(project).rootmap
stampRootMap  := $(rootMapRef).stamp
else
rootMapDir    := ../$(tag)
mergedRootMap := 
stampRootMap  :=
endif

AnalysisCamROOTLib_MergeMap :: $(stampRootMap) $(mergedRootMap)
	@:

.NOTPARALLEL : $(stampRootMap) $(mergedRootMap)

$(stampRootMap) $(mergedRootMap) :: $(rootMapRef)
	@echo "Running merge_rootmap  AnalysisCamROOTLib_MergeMap" 
	$(merge_rootmap_cmd) --do-merge \
         --input-file $(rootMapRef) --merged-file $(mergedRootMap)

AnalysisCamROOTLib_MergeMapclean ::
	$(cleanup_silent) $(merge_rootmap_cmd) --un-merge \
         --input-file $(rootMapRef) --merged-file $(mergedRootMap) ;
	$(cleanup_silent) $(remove_command) $(stampRootMap)
libAnalysisCamROOTLib_so_dependencies = ../x86_64-slc6-gcc49-opt/libAnalysisCamROOTLib.so
#-- start of cleanup_header --------------

clean :: AnalysisCamROOTLib_MergeMapclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(AnalysisCamROOTLib_MergeMap.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

AnalysisCamROOTLib_MergeMapclean ::
#-- end of cleanup_header ---------------
