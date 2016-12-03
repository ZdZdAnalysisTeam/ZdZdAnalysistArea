#-- start of make_header -----------------

#====================================
#  Document ZdZdPlottingConf
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

cmt_ZdZdPlottingConf_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_ZdZdPlottingConf_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_ZdZdPlottingConf

ZdZdPlotting_tag = $(tag)

#cmt_local_tagfile_ZdZdPlottingConf = $(ZdZdPlotting_tag)_ZdZdPlottingConf.make
cmt_local_tagfile_ZdZdPlottingConf = $(bin)$(ZdZdPlotting_tag)_ZdZdPlottingConf.make

else

tags      = $(tag),$(CMTEXTRATAGS)

ZdZdPlotting_tag = $(tag)

#cmt_local_tagfile_ZdZdPlottingConf = $(ZdZdPlotting_tag).make
cmt_local_tagfile_ZdZdPlottingConf = $(bin)$(ZdZdPlotting_tag).make

endif

include $(cmt_local_tagfile_ZdZdPlottingConf)
#-include $(cmt_local_tagfile_ZdZdPlottingConf)

ifdef cmt_ZdZdPlottingConf_has_target_tag

cmt_final_setup_ZdZdPlottingConf = $(bin)setup_ZdZdPlottingConf.make
cmt_dependencies_in_ZdZdPlottingConf = $(bin)dependencies_ZdZdPlottingConf.in
#cmt_final_setup_ZdZdPlottingConf = $(bin)ZdZdPlotting_ZdZdPlottingConfsetup.make
cmt_local_ZdZdPlottingConf_makefile = $(bin)ZdZdPlottingConf.make

else

cmt_final_setup_ZdZdPlottingConf = $(bin)setup.make
cmt_dependencies_in_ZdZdPlottingConf = $(bin)dependencies.in
#cmt_final_setup_ZdZdPlottingConf = $(bin)ZdZdPlottingsetup.make
cmt_local_ZdZdPlottingConf_makefile = $(bin)ZdZdPlottingConf.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)ZdZdPlottingsetup.make

#ZdZdPlottingConf :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'ZdZdPlottingConf'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = ZdZdPlottingConf/
#ZdZdPlottingConf::
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

.PHONY: ZdZdPlottingConf ZdZdPlottingConfclean

confpy  := ZdZdPlottingConf.py
conflib := $(bin)$(library_prefix)ZdZdPlotting.$(shlibsuffix)
confdb  := ZdZdPlotting.confdb
instdir := $(CMTINSTALLAREA)$(shared_install_subdir)/python/$(package)
product := $(instdir)/$(confpy)
initpy  := $(instdir)/__init__.py

ifdef GENCONF_ECHO
genconf_silent =
else
genconf_silent = $(silent)
endif

ZdZdPlottingConf :: ZdZdPlottingConfinstall

install :: ZdZdPlottingConfinstall

ZdZdPlottingConfinstall : /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/genConf/ZdZdPlotting/$(confpy)
	@echo "Installing /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/genConf/ZdZdPlotting in /afs/cern.ch/work/d/diboye/ZdZdTestArea/InstallArea/python" ; \
	 $(install_command) --exclude="*.py?" --exclude="__init__.py" --exclude="*.confdb" /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/genConf/ZdZdPlotting /afs/cern.ch/work/d/diboye/ZdZdTestArea/InstallArea/python ; \

/afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/genConf/ZdZdPlotting/$(confpy) : $(conflib) /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/genConf/ZdZdPlotting
	$(genconf_silent) $(genconfig_cmd)   -o /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/genConf/ZdZdPlotting -p $(package) \
	  --configurable-module=GaudiKernel.Proxy \
	  --configurable-default-name=Configurable.DefaultName \
	  --configurable-algorithm=ConfigurableAlgorithm \
	  --configurable-algtool=ConfigurableAlgTool \
	  --configurable-auditor=ConfigurableAuditor \
          --configurable-service=ConfigurableService \
	  -i ../$(tag)/$(library_prefix)ZdZdPlotting.$(shlibsuffix)

/afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/genConf/ZdZdPlotting:
	@ if [ ! -d /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/genConf/ZdZdPlotting ] ; then mkdir -p /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/genConf/ZdZdPlotting ; fi ;

ZdZdPlottingConfclean :: ZdZdPlottingConfuninstall
	$(cleanup_silent) $(remove_command) /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/genConf/ZdZdPlotting/$(confpy) /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/genConf/ZdZdPlotting/$(confdb)

uninstall :: ZdZdPlottingConfuninstall

ZdZdPlottingConfuninstall ::
	@$(uninstall_command) /afs/cern.ch/work/d/diboye/ZdZdTestArea/InstallArea/python
libZdZdPlotting_so_dependencies = ../x86_64-slc6-gcc49-opt/libZdZdPlotting.so
#-- start of cleanup_header --------------

clean :: ZdZdPlottingConfclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(ZdZdPlottingConf.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

ZdZdPlottingConfclean ::
#-- end of cleanup_header ---------------
