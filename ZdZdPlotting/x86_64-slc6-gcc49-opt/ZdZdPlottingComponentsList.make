#-- start of make_header -----------------

#====================================
#  Document ZdZdPlottingComponentsList
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

cmt_ZdZdPlottingComponentsList_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_ZdZdPlottingComponentsList_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_ZdZdPlottingComponentsList

ZdZdPlotting_tag = $(tag)

#cmt_local_tagfile_ZdZdPlottingComponentsList = $(ZdZdPlotting_tag)_ZdZdPlottingComponentsList.make
cmt_local_tagfile_ZdZdPlottingComponentsList = $(bin)$(ZdZdPlotting_tag)_ZdZdPlottingComponentsList.make

else

tags      = $(tag),$(CMTEXTRATAGS)

ZdZdPlotting_tag = $(tag)

#cmt_local_tagfile_ZdZdPlottingComponentsList = $(ZdZdPlotting_tag).make
cmt_local_tagfile_ZdZdPlottingComponentsList = $(bin)$(ZdZdPlotting_tag).make

endif

include $(cmt_local_tagfile_ZdZdPlottingComponentsList)
#-include $(cmt_local_tagfile_ZdZdPlottingComponentsList)

ifdef cmt_ZdZdPlottingComponentsList_has_target_tag

cmt_final_setup_ZdZdPlottingComponentsList = $(bin)setup_ZdZdPlottingComponentsList.make
cmt_dependencies_in_ZdZdPlottingComponentsList = $(bin)dependencies_ZdZdPlottingComponentsList.in
#cmt_final_setup_ZdZdPlottingComponentsList = $(bin)ZdZdPlotting_ZdZdPlottingComponentsListsetup.make
cmt_local_ZdZdPlottingComponentsList_makefile = $(bin)ZdZdPlottingComponentsList.make

else

cmt_final_setup_ZdZdPlottingComponentsList = $(bin)setup.make
cmt_dependencies_in_ZdZdPlottingComponentsList = $(bin)dependencies.in
#cmt_final_setup_ZdZdPlottingComponentsList = $(bin)ZdZdPlottingsetup.make
cmt_local_ZdZdPlottingComponentsList_makefile = $(bin)ZdZdPlottingComponentsList.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)ZdZdPlottingsetup.make

#ZdZdPlottingComponentsList :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'ZdZdPlottingComponentsList'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = ZdZdPlottingComponentsList/
#ZdZdPlottingComponentsList::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
##
componentslistfile = ZdZdPlotting.components
COMPONENTSLIST_DIR = ../$(tag)
fulllibname = libZdZdPlotting.$(shlibsuffix)

ZdZdPlottingComponentsList :: ${COMPONENTSLIST_DIR}/$(componentslistfile)
	@:

${COMPONENTSLIST_DIR}/$(componentslistfile) :: $(bin)$(fulllibname)
	@echo 'Generating componentslist file for $(fulllibname)'
	cd ../$(tag);$(listcomponents_cmd) --output ${COMPONENTSLIST_DIR}/$(componentslistfile) $(fulllibname)

install :: ZdZdPlottingComponentsListinstall
ZdZdPlottingComponentsListinstall :: ZdZdPlottingComponentsList

uninstall :: ZdZdPlottingComponentsListuninstall
ZdZdPlottingComponentsListuninstall :: ZdZdPlottingComponentsListclean

ZdZdPlottingComponentsListclean ::
	@echo 'Deleting $(componentslistfile)'
	@rm -f ${COMPONENTSLIST_DIR}/$(componentslistfile)

#-- start of cleanup_header --------------

clean :: ZdZdPlottingComponentsListclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(ZdZdPlottingComponentsList.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

ZdZdPlottingComponentsListclean ::
#-- end of cleanup_header ---------------
