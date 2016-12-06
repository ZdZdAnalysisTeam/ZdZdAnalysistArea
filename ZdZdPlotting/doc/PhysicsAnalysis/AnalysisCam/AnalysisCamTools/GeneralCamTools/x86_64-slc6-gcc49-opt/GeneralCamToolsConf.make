#-- start of make_header -----------------

#====================================
#  Document GeneralCamToolsConf
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

cmt_GeneralCamToolsConf_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_GeneralCamToolsConf_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_GeneralCamToolsConf

GeneralCamTools_tag = $(tag)

#cmt_local_tagfile_GeneralCamToolsConf = $(GeneralCamTools_tag)_GeneralCamToolsConf.make
cmt_local_tagfile_GeneralCamToolsConf = $(bin)$(GeneralCamTools_tag)_GeneralCamToolsConf.make

else

tags      = $(tag),$(CMTEXTRATAGS)

GeneralCamTools_tag = $(tag)

#cmt_local_tagfile_GeneralCamToolsConf = $(GeneralCamTools_tag).make
cmt_local_tagfile_GeneralCamToolsConf = $(bin)$(GeneralCamTools_tag).make

endif

include $(cmt_local_tagfile_GeneralCamToolsConf)
#-include $(cmt_local_tagfile_GeneralCamToolsConf)

ifdef cmt_GeneralCamToolsConf_has_target_tag

cmt_final_setup_GeneralCamToolsConf = $(bin)setup_GeneralCamToolsConf.make
cmt_dependencies_in_GeneralCamToolsConf = $(bin)dependencies_GeneralCamToolsConf.in
#cmt_final_setup_GeneralCamToolsConf = $(bin)GeneralCamTools_GeneralCamToolsConfsetup.make
cmt_local_GeneralCamToolsConf_makefile = $(bin)GeneralCamToolsConf.make

else

cmt_final_setup_GeneralCamToolsConf = $(bin)setup.make
cmt_dependencies_in_GeneralCamToolsConf = $(bin)dependencies.in
#cmt_final_setup_GeneralCamToolsConf = $(bin)GeneralCamToolssetup.make
cmt_local_GeneralCamToolsConf_makefile = $(bin)GeneralCamToolsConf.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)GeneralCamToolssetup.make

#GeneralCamToolsConf :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'GeneralCamToolsConf'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = GeneralCamToolsConf/
#GeneralCamToolsConf::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
# File: cmt/fragments/genconfig_header
# Author: Wim Lavrijsen (WLavrijsen@lbl.gov)

# Use genconf.exe to create configurables python modules, then have the
# normal python install procedure take over.

.PHONY: GeneralCamToolsConf GeneralCamToolsConfclean

confpy  := GeneralCamToolsConf.py
conflib := $(bin)$(library_prefix)GeneralCamTools.$(shlibsuffix)
confdb  := GeneralCamTools.confdb
instdir := $(CMTINSTALLAREA)$(shared_install_subdir)/python/$(package)
product := $(instdir)/$(confpy)
initpy  := $(instdir)/__init__.py

ifdef GENCONF_ECHO
genconf_silent =
else
genconf_silent = $(silent)
endif

GeneralCamToolsConf :: GeneralCamToolsConfinstall

install :: GeneralCamToolsConfinstall

GeneralCamToolsConfinstall : /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamTools/GeneralCamTools/genConf/GeneralCamTools/$(confpy)
	@echo "Installing /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamTools/GeneralCamTools/genConf/GeneralCamTools in /afs/cern.ch/work/d/diboye/ZdZdTestArea/InstallArea/python" ; \
	 $(install_command) --exclude="*.py?" --exclude="__init__.py" --exclude="*.confdb" /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamTools/GeneralCamTools/genConf/GeneralCamTools /afs/cern.ch/work/d/diboye/ZdZdTestArea/InstallArea/python ; \

/afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamTools/GeneralCamTools/genConf/GeneralCamTools/$(confpy) : $(conflib) /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamTools/GeneralCamTools/genConf/GeneralCamTools
	$(genconf_silent) $(genconfig_cmd)   -o /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamTools/GeneralCamTools/genConf/GeneralCamTools -p $(package) \
	  --configurable-module=GaudiKernel.Proxy \
	  --configurable-default-name=Configurable.DefaultName \
	  --configurable-algorithm=ConfigurableAlgorithm \
	  --configurable-algtool=ConfigurableAlgTool \
	  --configurable-auditor=ConfigurableAuditor \
          --configurable-service=ConfigurableService \
	  -i ../$(tag)/$(library_prefix)GeneralCamTools.$(shlibsuffix)

/afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamTools/GeneralCamTools/genConf/GeneralCamTools:
	@ if [ ! -d /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamTools/GeneralCamTools/genConf/GeneralCamTools ] ; then mkdir -p /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamTools/GeneralCamTools/genConf/GeneralCamTools ; fi ;

GeneralCamToolsConfclean :: GeneralCamToolsConfuninstall
	$(cleanup_silent) $(remove_command) /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamTools/GeneralCamTools/genConf/GeneralCamTools/$(confpy) /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamTools/GeneralCamTools/genConf/GeneralCamTools/$(confdb)

uninstall :: GeneralCamToolsConfuninstall

GeneralCamToolsConfuninstall ::
	@$(uninstall_command) /afs/cern.ch/work/d/diboye/ZdZdTestArea/InstallArea/python
libGeneralCamTools_so_dependencies = ../x86_64-slc6-gcc49-opt/libGeneralCamTools.so
#-- start of cleanup_header --------------

clean :: GeneralCamToolsConfclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(GeneralCamToolsConf.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

GeneralCamToolsConfclean ::
#-- end of cleanup_header ---------------
