#-- start of make_header -----------------

#====================================
#  Document ZdZdPlottingConfDbMerge
#
#   Generated Fri Dec  2 18:47:30 2016  by diboye
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_ZdZdPlottingConfDbMerge_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_ZdZdPlottingConfDbMerge_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_ZdZdPlottingConfDbMerge

ZdZdPlotting_tag = $(tag)

#cmt_local_tagfile_ZdZdPlottingConfDbMerge = $(ZdZdPlotting_tag)_ZdZdPlottingConfDbMerge.make
cmt_local_tagfile_ZdZdPlottingConfDbMerge = $(bin)$(ZdZdPlotting_tag)_ZdZdPlottingConfDbMerge.make

else

tags      = $(tag),$(CMTEXTRATAGS)

ZdZdPlotting_tag = $(tag)

#cmt_local_tagfile_ZdZdPlottingConfDbMerge = $(ZdZdPlotting_tag).make
cmt_local_tagfile_ZdZdPlottingConfDbMerge = $(bin)$(ZdZdPlotting_tag).make

endif

include $(cmt_local_tagfile_ZdZdPlottingConfDbMerge)
#-include $(cmt_local_tagfile_ZdZdPlottingConfDbMerge)

ifdef cmt_ZdZdPlottingConfDbMerge_has_target_tag

cmt_final_setup_ZdZdPlottingConfDbMerge = $(bin)setup_ZdZdPlottingConfDbMerge.make
cmt_dependencies_in_ZdZdPlottingConfDbMerge = $(bin)dependencies_ZdZdPlottingConfDbMerge.in
#cmt_final_setup_ZdZdPlottingConfDbMerge = $(bin)ZdZdPlotting_ZdZdPlottingConfDbMergesetup.make
cmt_local_ZdZdPlottingConfDbMerge_makefile = $(bin)ZdZdPlottingConfDbMerge.make

else

cmt_final_setup_ZdZdPlottingConfDbMerge = $(bin)setup.make
cmt_dependencies_in_ZdZdPlottingConfDbMerge = $(bin)dependencies.in
#cmt_final_setup_ZdZdPlottingConfDbMerge = $(bin)ZdZdPlottingsetup.make
cmt_local_ZdZdPlottingConfDbMerge_makefile = $(bin)ZdZdPlottingConfDbMerge.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)ZdZdPlottingsetup.make

#ZdZdPlottingConfDbMerge :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'ZdZdPlottingConfDbMerge'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = ZdZdPlottingConfDbMerge/
#ZdZdPlottingConfDbMerge::
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

.PHONY: ZdZdPlottingConfDbMerge ZdZdPlottingConfDbMergeclean

# default is already '#'
#genconfDb_comment_char := "'#'"

instdir      := ${CMTINSTALLAREA}/$(tag)
confDbRef    := /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/genConf/ZdZdPlotting/ZdZdPlotting.confdb
stampConfDb  := $(confDbRef).stamp
mergedConfDb := $(instdir)/lib/$(project).confdb

ZdZdPlottingConfDbMerge :: $(stampConfDb) $(mergedConfDb)
	@:

.NOTPARALLEL : $(stampConfDb) $(mergedConfDb)

$(stampConfDb) $(mergedConfDb) :: $(confDbRef)
	@echo "Running merge_genconfDb  ZdZdPlottingConfDbMerge"
	$(merge_genconfDb_cmd) \
          --do-merge \
          --input-file $(confDbRef) \
          --merged-file $(mergedConfDb)

ZdZdPlottingConfDbMergeclean ::
	$(cleanup_silent) $(merge_genconfDb_cmd) \
          --un-merge \
          --input-file $(confDbRef) \
          --merged-file $(mergedConfDb)	;
	$(cleanup_silent) $(remove_command) $(stampConfDb)
libZdZdPlotting_so_dependencies = ../x86_64-slc6-gcc49-opt/libZdZdPlotting.so
#-- start of cleanup_header --------------

clean :: ZdZdPlottingConfDbMergeclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(ZdZdPlottingConfDbMerge.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

ZdZdPlottingConfDbMergeclean ::
#-- end of cleanup_header ---------------
