#-- start of make_header -----------------

#====================================
#  Document install_joboptions
#
#   Generated Fri Dec  2 18:47:11 2016  by diboye
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_install_joboptions_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_install_joboptions_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_install_joboptions

ZdZdPlotting_tag = $(tag)

#cmt_local_tagfile_install_joboptions = $(ZdZdPlotting_tag)_install_joboptions.make
cmt_local_tagfile_install_joboptions = $(bin)$(ZdZdPlotting_tag)_install_joboptions.make

else

tags      = $(tag),$(CMTEXTRATAGS)

ZdZdPlotting_tag = $(tag)

#cmt_local_tagfile_install_joboptions = $(ZdZdPlotting_tag).make
cmt_local_tagfile_install_joboptions = $(bin)$(ZdZdPlotting_tag).make

endif

include $(cmt_local_tagfile_install_joboptions)
#-include $(cmt_local_tagfile_install_joboptions)

ifdef cmt_install_joboptions_has_target_tag

cmt_final_setup_install_joboptions = $(bin)setup_install_joboptions.make
cmt_dependencies_in_install_joboptions = $(bin)dependencies_install_joboptions.in
#cmt_final_setup_install_joboptions = $(bin)ZdZdPlotting_install_joboptionssetup.make
cmt_local_install_joboptions_makefile = $(bin)install_joboptions.make

else

cmt_final_setup_install_joboptions = $(bin)setup.make
cmt_dependencies_in_install_joboptions = $(bin)dependencies.in
#cmt_final_setup_install_joboptions = $(bin)ZdZdPlottingsetup.make
cmt_local_install_joboptions_makefile = $(bin)install_joboptions.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)ZdZdPlottingsetup.make

#install_joboptions :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'install_joboptions'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = install_joboptions/
#install_joboptions::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------


ifeq ($(INSTALLAREA),)
installarea = $(CMTINSTALLAREA)
else
ifeq ($(findstring `,$(INSTALLAREA)),`)
installarea = $(shell $(subst `,, $(INSTALLAREA)))
else
installarea = $(INSTALLAREA)
endif
endif

install_dir = ${installarea}/jobOptions/ZdZdPlotting

install_joboptions :: install_joboptionsinstall ;

install :: install_joboptionsinstall ;

install_joboptionsclean :: install_joboptionsuninstall

uninstall :: install_joboptionsuninstall


# This is to avoid error in case there are no files to install
# Ideally, the fragment should not be used without files to install,
# and this line should be dropped then
install_joboptionsinstall :: ;

ZdZdPlottingAlgJobOptions_py_dependencies = ../share/ZdZdPlottingAlgJobOptions.py


install_joboptionsinstall :: ${install_dir}/ZdZdPlottingAlgJobOptions.py ;

${install_dir}/ZdZdPlottingAlgJobOptions.py :: ../share/ZdZdPlottingAlgJobOptions.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../share/ZdZdPlottingAlgJobOptions.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "ZdZdPlottingAlgJobOptions.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/AthAnalysisBase/x86_64-slc6-gcc49-opt/2.4.22/AthAnalysisBase/2.4.22/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../share/ZdZdPlottingAlgJobOptions.py : ;

install_joboptionsuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../share/ZdZdPlottingAlgJobOptions.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "ZdZdPlottingAlgJobOptions.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi
#-- start of cleanup_header --------------

clean :: install_joboptionsclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(install_joboptions.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

install_joboptionsclean ::
#-- end of cleanup_header ---------------
