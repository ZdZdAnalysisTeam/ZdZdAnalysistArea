#-- start of make_header -----------------

#====================================
#  Document AnalysisCamROOTLibDict
#
#   Generated Sat Nov 19 20:05:51 2016  by diboye
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_AnalysisCamROOTLibDict_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_AnalysisCamROOTLibDict_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_AnalysisCamROOTLibDict

AnalysisCamROOT_tag = $(tag)

#cmt_local_tagfile_AnalysisCamROOTLibDict = $(AnalysisCamROOT_tag)_AnalysisCamROOTLibDict.make
cmt_local_tagfile_AnalysisCamROOTLibDict = $(bin)$(AnalysisCamROOT_tag)_AnalysisCamROOTLibDict.make

else

tags      = $(tag),$(CMTEXTRATAGS)

AnalysisCamROOT_tag = $(tag)

#cmt_local_tagfile_AnalysisCamROOTLibDict = $(AnalysisCamROOT_tag).make
cmt_local_tagfile_AnalysisCamROOTLibDict = $(bin)$(AnalysisCamROOT_tag).make

endif

include $(cmt_local_tagfile_AnalysisCamROOTLibDict)
#-include $(cmt_local_tagfile_AnalysisCamROOTLibDict)

ifdef cmt_AnalysisCamROOTLibDict_has_target_tag

cmt_final_setup_AnalysisCamROOTLibDict = $(bin)setup_AnalysisCamROOTLibDict.make
cmt_dependencies_in_AnalysisCamROOTLibDict = $(bin)dependencies_AnalysisCamROOTLibDict.in
#cmt_final_setup_AnalysisCamROOTLibDict = $(bin)AnalysisCamROOT_AnalysisCamROOTLibDictsetup.make
cmt_local_AnalysisCamROOTLibDict_makefile = $(bin)AnalysisCamROOTLibDict.make

else

cmt_final_setup_AnalysisCamROOTLibDict = $(bin)setup.make
cmt_dependencies_in_AnalysisCamROOTLibDict = $(bin)dependencies.in
#cmt_final_setup_AnalysisCamROOTLibDict = $(bin)AnalysisCamROOTsetup.make
cmt_local_AnalysisCamROOTLibDict_makefile = $(bin)AnalysisCamROOTLibDict.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)AnalysisCamROOTsetup.make

#AnalysisCamROOTLibDict :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'AnalysisCamROOTLibDict'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = AnalysisCamROOTLibDict/
#AnalysisCamROOTLibDict::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
# Header fragment for root_cint:
#
# Overall action: 
#
#   These fragments (root_cint + _header + _trailer) process files to
# be added to the Root Cint dictionary. This is done by copying the
# names of files to be processed into a directory $(dict) and then
# running cint to generate a C++ file to be built.
#
# Work is separated into:
#
#   root_cint_header  -  create dir $(dict), has overall dependency
# 			 which makes things run
#   root_cint         -  copies the name of each file to be processed
#			 into a file in $(dict)
#   root_cint_trailer -  runs cint and has cleanup
#
# The following macros must be externally set in a requirements file,
# e.g. with a pattern:
#
# dict       -   scratch directory for generated files, e.g. $(bin)dict/
#  		 (must have trailing '/')
#
# root_cint_includes - required include path, e.g. ${includes}
#
# CONSTITUENT -  This is specified in "document root_cint <constituent>"
#                Note that <constituent>.cxx should be added to the
#		 "library" statement.

dict_dir  = $(dict)AnalysisCamROOTLibDict
AnalysisCamROOTLibDict_output = $(dict_dir)/

# Basic dependency that forces cint to be run in root_cint_trailer
# PCM_make_target is defined for ROOT6 as AnalysisCamROOTLibDict.pcm in root_cint_trailer and should trigger PCM installation
AnalysisCamROOTLibDict :: $(dict)AnalysisCamROOTLibDict.cxx ${PCM_make_target_for_AnalysisCamROOTLibDict}
	@echo "------> AnalysisCamROOTLibDict ok"

# Target to run "mkdir" before copying the files in root_cint
$(AnalysisCamROOTLibDict_output)TChannelInfo.h $(AnalysisCamROOTLibDict_output)LinkDef.h :: build_dir
	@test 1=1

# Make the generation directory 
build_dir :: 
	test -d ${dict_dir} || mkdir -p ${dict_dir}; 


# MN:  prepare place for ROOT PCM installation
installDir := ${CMTINSTALLAREA}/$(tag)/lib/

${installDir} :: 
	mkdir -p ${installDir}

TChannelInfo_h_dependencies = /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamROOT/AnalysisCamROOT/TChannelInfo.h
LinkDef_h_dependencies = /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamROOT/AnalysisCamROOT/LinkDef.h
# Body fragment for root_cint:
#
# For each file specified in the "document root_cint" statement, the
# fully qualified FILE NAME is copied into a file of the same name in
# the directory $(dict).
#
# See root_cint_header for more complete documentation


# store the include filename as we want ROOT6 to remember it (relative to package root)
${dict_dir}/TChannelInfo.h : RELNAME = $(subst $(PACKAGE_ROOT)/,,/afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamROOT/AnalysisCamROOT/TChannelInfo.h)

${dict_dir}/TChannelInfo.h :: /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamROOT/AnalysisCamROOT/TChannelInfo.h
ifneq "TChannelInfo" "LinkDef"
	@echo "root_cint: File $(RELNAME) will be added to dictionary AnalysisCamROOTLibDict";
endif
	@echo $(RELNAME) > $@;
# Body fragment for root_cint:
#
# For each file specified in the "document root_cint" statement, the
# fully qualified FILE NAME is copied into a file of the same name in
# the directory $(dict).
#
# See root_cint_header for more complete documentation


# store the include filename as we want ROOT6 to remember it (relative to package root)
${dict_dir}/LinkDef.h : RELNAME = $(subst $(PACKAGE_ROOT)/,,/afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamROOT/AnalysisCamROOT/LinkDef.h)

${dict_dir}/LinkDef.h :: /afs/cern.ch/work/d/diboye/ZdZdTestArea/ZdZdPlotting/doc/PhysicsAnalysis/AnalysisCam/AnalysisCamROOT/AnalysisCamROOT/LinkDef.h
ifneq "LinkDef" "LinkDef"
	@echo "root_cint: File $(RELNAME) will be added to dictionary AnalysisCamROOTLibDict";
endif
	@echo $(RELNAME) > $@;
# Trailer for root_cint fragment:
#
# This fragment runs root cint.
#
# See root_cint_header for more complete documentation
#

# Dependency on $(AnalysisCamROOTLibDict_output)TChannelInfo.h $(AnalysisCamROOTLibDict_output)LinkDef.h - the full list of $(dict)${NAME}.h, is needed
# for parallel build
$(dict)AnalysisCamROOTLibDict.cxx :: $(AnalysisCamROOTLibDict_output)TChannelInfo.h $(AnalysisCamROOTLibDict_output)LinkDef.h #$(dict)AnalysisCamROOTLibDict.stamp 
	cd $(bin); $(rootcint) -f $(dict)AnalysisCamROOTLibDict.cxx ${rootmap_opts_AnalysisCamROOTLibDict} -c ${cint_includes_AnalysisCamROOTLibDict} `cat $(AnalysisCamROOTLibDict_output)TChannelInfo.h $(AnalysisCamROOTLibDict_output)LinkDef.h`  



#===========================
#MN:  install the PCM file (named $pcmFN) generated by ROOT during dictionary creation (see rule above)

pcmFN := AnalysisCamROOTLibDict_rdict.pcm


AnalysisCamROOTLibDict.pcm :  ${installDir}${pcmFN}
	@echo ${pcmFN} installed


${installDir}${pcmFN} : ${dict}${pcmFN} ${installDir}
	@echo "Installing PCM  ${pcmFN}"
#	$(symlink_command) $< $@   # MN: need to get the correct dest path that is good for a symlink ($bin is relative)
	$(atlas_install_command)  $<  $@ 

${dict}${pcmFN} :  $(dict)AnalysisCamROOTLibDict.cxx

# cleanup:
clean :: AnalysisCamROOTLibDictclean
	@cd .
	@echo "AnalysisCamROOTLibDictclean  done"

AnalysisCamROOTLibDictclean :: 
	$(cleanup_echo) ROOT dictionary
	-$(cleanup_silent) rm -fr $(dict)
	-rm -f ${installDir}${pcmFN}


#-- start of cleanup_header --------------

clean :: AnalysisCamROOTLibDictclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(AnalysisCamROOTLibDict.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

AnalysisCamROOTLibDictclean ::
#-- end of cleanup_header ---------------
