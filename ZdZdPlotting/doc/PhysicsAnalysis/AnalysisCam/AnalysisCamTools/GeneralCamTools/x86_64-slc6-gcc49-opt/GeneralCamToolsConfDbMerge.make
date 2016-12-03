#-- start of make_header -----------------

#====================================
#  Document GeneralCamToolsConfDbMerge
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

cmt_GeneralCamToolsConfDbMerge_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_GeneralCamToolsConfDbMerge_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_GeneralCamToolsConfDbMerge

GeneralCamTools_tag = $(tag)

#cmt_local_tagfile_GeneralCamToolsConfDbMerge = $(GeneralCamTools_tag)_GeneralCamToolsConfDbMerge.make
cmt_local_tagfile_GeneralCamToolsConfDbMerge = $(bin)$(GeneralCamTools_tag)_GeneralCamToolsConfDbMerge.make

else

tags      = $(tag),$(CMTEXTRATAGS)

GeneralCamTools_tag = $(tag)

#cmt_local_tagfile_GeneralCamToolsConfDbMerge = $(GeneralCamTools_tag).make
cmt_local_tagfile_GeneralCamToolsConfDbMerge = $(bin)$(GeneralCamTools_tag).make

endif

include $(cmt_local_tagfile_GeneralCamToolsConfDbMerge)
#-include $(cmt_local_tagfile_GeneralCamToolsConfDbMerge)

ifdef cmt_GeneralCamToolsConfDbMerge_has_target_tag

cmt_final_setup_GeneralCamToolsConfDbMerge = $(bin)setup_GeneralCamToolsConfDbMerge.make
cmt_dependencies_in_GeneralCamToolsConfDbMerge = $(bin)dependencies_GeneralCamToolsConfDbMerge.in
#cmt_final_setup_GeneralCamToolsConfDbMerge = $(bin)GeneralCamTools_GeneralCamToolsConfDbMergesetup.make
cmt_local_GeneralCamToolsConfDbMerge_makefile = $(bin)GeneralCamToolsConfDbMerge.make

else

cmt_final_setup_GeneralCamToolsConfDbMerge = $(bin)setup.make
cmt_dependencies_in_GeneralCamToolsConfDbMerge = $(bin)dependencies.in
#cmt_final_setup_GeneralCamToolsConfDbMerge = $(bin)GeneralCamToolssetup.make
cmt_local_GeneralCamToolsConfDbMerge_makefile = $(bin)GeneralCamToolsConfDbMerge.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)GeneralCamToolssetup.make

#GeneralCamToolsConfDbMerge :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'GeneralCamToolsConfDbMerge'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = GeneralCamToolsConfDbMerge/
#GeneralCamToolsConfDbMerge::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
# File: cmt/fragments/merge_genconfDb_header
# Author: Sebastien Binet (binet@cern.ch)

# Makefile fragment to merge a <library>.confdb file into a single
# <project>.confdb file in the (lib) install area

.PHONY: GeneralCamToolsConfDbMerge GeneralCamToolsConfDbMergeclean

# default is already '#'
#genconfDb_comment_char := "'#'"

instdir      := ${CMTINSTALLAREA}/$(tag)
confDbRef    := /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamTools/GeneralCamTools/genConf/GeneralCamTools/GeneralCamTools.confdb
stampConfDb  := $(confDbRef).stamp
mergedConfDb := $(instdir)/lib/$(project).confdb

GeneralCamToolsConfDbMerge :: $(stampConfDb) $(mergedConfDb)
	@:

.NOTPARALLEL : $(stampConfDb) $(mergedConfDb)

$(stampConfDb) $(mergedConfDb) :: $(confDbRef)
	@echo "Running merge_genconfDb  GeneralCamToolsConfDbMerge"
	$(merge_genconfDb_cmd) \
          --do-merge \
          --input-file $(confDbRef) \
          --merged-file $(mergedConfDb)

GeneralCamToolsConfDbMergeclean ::
	$(cleanup_silent) $(merge_genconfDb_cmd) \
          --un-merge \
          --input-file $(confDbRef) \
          --merged-file $(mergedConfDb)	;
	$(cleanup_silent) $(remove_command) $(stampConfDb)
libGeneralCamTools_so_dependencies = ../x86_64-slc6-gcc49-opt/libGeneralCamTools.so
#-- start of cleanup_header --------------

clean :: GeneralCamToolsConfDbMergeclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(GeneralCamToolsConfDbMerge.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

GeneralCamToolsConfDbMergeclean ::
#-- end of cleanup_header ---------------
