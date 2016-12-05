#-- start of make_header -----------------

#====================================
#  Document ZdZdPlottingCLIDDB
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

cmt_ZdZdPlottingCLIDDB_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_ZdZdPlottingCLIDDB_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_ZdZdPlottingCLIDDB

ZdZdPlotting_tag = $(tag)

#cmt_local_tagfile_ZdZdPlottingCLIDDB = $(ZdZdPlotting_tag)_ZdZdPlottingCLIDDB.make
cmt_local_tagfile_ZdZdPlottingCLIDDB = $(bin)$(ZdZdPlotting_tag)_ZdZdPlottingCLIDDB.make

else

tags      = $(tag),$(CMTEXTRATAGS)

ZdZdPlotting_tag = $(tag)

#cmt_local_tagfile_ZdZdPlottingCLIDDB = $(ZdZdPlotting_tag).make
cmt_local_tagfile_ZdZdPlottingCLIDDB = $(bin)$(ZdZdPlotting_tag).make

endif

include $(cmt_local_tagfile_ZdZdPlottingCLIDDB)
#-include $(cmt_local_tagfile_ZdZdPlottingCLIDDB)

ifdef cmt_ZdZdPlottingCLIDDB_has_target_tag

cmt_final_setup_ZdZdPlottingCLIDDB = $(bin)setup_ZdZdPlottingCLIDDB.make
cmt_dependencies_in_ZdZdPlottingCLIDDB = $(bin)dependencies_ZdZdPlottingCLIDDB.in
#cmt_final_setup_ZdZdPlottingCLIDDB = $(bin)ZdZdPlotting_ZdZdPlottingCLIDDBsetup.make
cmt_local_ZdZdPlottingCLIDDB_makefile = $(bin)ZdZdPlottingCLIDDB.make

else

cmt_final_setup_ZdZdPlottingCLIDDB = $(bin)setup.make
cmt_dependencies_in_ZdZdPlottingCLIDDB = $(bin)dependencies.in
#cmt_final_setup_ZdZdPlottingCLIDDB = $(bin)ZdZdPlottingsetup.make
cmt_local_ZdZdPlottingCLIDDB_makefile = $(bin)ZdZdPlottingCLIDDB.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)ZdZdPlottingsetup.make

#ZdZdPlottingCLIDDB :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'ZdZdPlottingCLIDDB'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = ZdZdPlottingCLIDDB/
#ZdZdPlottingCLIDDB::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
# File: cmt/fragments/genCLIDDB_header
# Author: Paolo Calafiura
# derived from genconf_header

# Use genCLIDDB_cmd to create package clid.db files

.PHONY: ZdZdPlottingCLIDDB ZdZdPlottingCLIDDBclean

outname := clid.db
cliddb  := ZdZdPlotting_$(outname)
instdir := $(CMTINSTALLAREA)/share
result  := $(instdir)/$(cliddb)
product := $(instdir)/$(outname)
conflib := $(bin)$(library_prefix)ZdZdPlotting.$(shlibsuffix)

ZdZdPlottingCLIDDB :: $(result)

$(instdir) :
	$(mkdir) -p $(instdir)

$(result) : $(conflib) $(product)
	@$(genCLIDDB_cmd) -p ZdZdPlotting -i$(product) -o $(result)

$(product) : $(instdir)
	touch $(product)

ZdZdPlottingCLIDDBclean ::
	$(cleanup_silent) $(uninstall_command) $(product) $(result)
	$(cleanup_silent) $(cmt_uninstallarea_command) $(product) $(result)

#-- start of cleanup_header --------------

clean :: ZdZdPlottingCLIDDBclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(ZdZdPlottingCLIDDB.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

ZdZdPlottingCLIDDBclean ::
#-- end of cleanup_header ---------------
