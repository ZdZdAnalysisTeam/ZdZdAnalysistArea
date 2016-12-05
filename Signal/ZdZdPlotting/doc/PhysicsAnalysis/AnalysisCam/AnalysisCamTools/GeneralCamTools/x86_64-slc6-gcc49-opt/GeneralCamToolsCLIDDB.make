#-- start of make_header -----------------

#====================================
#  Document GeneralCamToolsCLIDDB
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

cmt_GeneralCamToolsCLIDDB_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_GeneralCamToolsCLIDDB_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_GeneralCamToolsCLIDDB

GeneralCamTools_tag = $(tag)

#cmt_local_tagfile_GeneralCamToolsCLIDDB = $(GeneralCamTools_tag)_GeneralCamToolsCLIDDB.make
cmt_local_tagfile_GeneralCamToolsCLIDDB = $(bin)$(GeneralCamTools_tag)_GeneralCamToolsCLIDDB.make

else

tags      = $(tag),$(CMTEXTRATAGS)

GeneralCamTools_tag = $(tag)

#cmt_local_tagfile_GeneralCamToolsCLIDDB = $(GeneralCamTools_tag).make
cmt_local_tagfile_GeneralCamToolsCLIDDB = $(bin)$(GeneralCamTools_tag).make

endif

include $(cmt_local_tagfile_GeneralCamToolsCLIDDB)
#-include $(cmt_local_tagfile_GeneralCamToolsCLIDDB)

ifdef cmt_GeneralCamToolsCLIDDB_has_target_tag

cmt_final_setup_GeneralCamToolsCLIDDB = $(bin)setup_GeneralCamToolsCLIDDB.make
cmt_dependencies_in_GeneralCamToolsCLIDDB = $(bin)dependencies_GeneralCamToolsCLIDDB.in
#cmt_final_setup_GeneralCamToolsCLIDDB = $(bin)GeneralCamTools_GeneralCamToolsCLIDDBsetup.make
cmt_local_GeneralCamToolsCLIDDB_makefile = $(bin)GeneralCamToolsCLIDDB.make

else

cmt_final_setup_GeneralCamToolsCLIDDB = $(bin)setup.make
cmt_dependencies_in_GeneralCamToolsCLIDDB = $(bin)dependencies.in
#cmt_final_setup_GeneralCamToolsCLIDDB = $(bin)GeneralCamToolssetup.make
cmt_local_GeneralCamToolsCLIDDB_makefile = $(bin)GeneralCamToolsCLIDDB.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)GeneralCamToolssetup.make

#GeneralCamToolsCLIDDB :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'GeneralCamToolsCLIDDB'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = GeneralCamToolsCLIDDB/
#GeneralCamToolsCLIDDB::
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

.PHONY: GeneralCamToolsCLIDDB GeneralCamToolsCLIDDBclean

outname := clid.db
cliddb  := GeneralCamTools_$(outname)
instdir := $(CMTINSTALLAREA)/share
result  := $(instdir)/$(cliddb)
product := $(instdir)/$(outname)
conflib := $(bin)$(library_prefix)GeneralCamTools.$(shlibsuffix)

GeneralCamToolsCLIDDB :: $(result)

$(instdir) :
	$(mkdir) -p $(instdir)

$(result) : $(conflib) $(product)
	@$(genCLIDDB_cmd) -p GeneralCamTools -i$(product) -o $(result)

$(product) : $(instdir)
	touch $(product)

GeneralCamToolsCLIDDBclean ::
	$(cleanup_silent) $(uninstall_command) $(product) $(result)
	$(cleanup_silent) $(cmt_uninstallarea_command) $(product) $(result)

#-- start of cleanup_header --------------

clean :: GeneralCamToolsCLIDDBclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(GeneralCamToolsCLIDDB.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

GeneralCamToolsCLIDDBclean ::
#-- end of cleanup_header ---------------
