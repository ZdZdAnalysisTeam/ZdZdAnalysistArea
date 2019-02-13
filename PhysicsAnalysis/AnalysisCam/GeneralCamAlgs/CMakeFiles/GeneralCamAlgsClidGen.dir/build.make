# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.11

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase/x86_64/Cmake/3.11.0/Linux-x86_64/bin/cmake

# The command to remove a file.
RM = /cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase/x86_64/Cmake/3.11.0/Linux-x86_64/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /afs/cern.ch/work/d/diboye/ZdZdPostProcessing

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /afs/cern.ch/work/d/diboye/diallo_new

# Utility rule file for GeneralCamAlgsClidGen.

# Include the progress variables for this target.
include PhysicsAnalysis/AnalysisCam/GeneralCamAlgs/CMakeFiles/GeneralCamAlgsClidGen.dir/progress.make

PhysicsAnalysis/AnalysisCam/GeneralCamAlgs/CMakeFiles/GeneralCamAlgsClidGen: PhysicsAnalysis/AnalysisCam/GeneralCamAlgs/GeneralCamAlgs_clid.db


PhysicsAnalysis/AnalysisCam/GeneralCamAlgs/GeneralCamAlgs_clid.db: /cvmfs/atlas.cern.ch/repo/sw/software/21.2/AthAnalysis/21.2.48/InstallArea/x86_64-slc6-gcc62-opt/bin/genCLIDDB
PhysicsAnalysis/AnalysisCam/GeneralCamAlgs/GeneralCamAlgs_clid.db: /cvmfs/atlas.cern.ch/repo/sw/software/21.2/AthAnalysis/21.2.48/InstallArea/x86_64-slc6-gcc62-opt/lib/libCLIDComps.so
PhysicsAnalysis/AnalysisCam/GeneralCamAlgs/GeneralCamAlgs_clid.db: x86_64-slc6-gcc62-opt/lib/libGeneralCamAlgs.so
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/afs/cern.ch/work/d/diboye/diallo_new/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating GeneralCamAlgs_clid.db"
	cd /afs/cern.ch/work/d/diboye/diallo_new/PhysicsAnalysis/AnalysisCam/GeneralCamAlgs && /cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase/x86_64/Cmake/3.11.0/Linux-x86_64/bin/cmake -E make_directory /afs/cern.ch/work/d/diboye/diallo_new/x86_64-slc6-gcc62-opt/share
	cd /afs/cern.ch/work/d/diboye/diallo_new/PhysicsAnalysis/AnalysisCam/GeneralCamAlgs && /cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase/x86_64/Cmake/3.11.0/Linux-x86_64/bin/cmake -E touch /afs/cern.ch/work/d/diboye/diallo_new/PhysicsAnalysis/AnalysisCam/GeneralCamAlgs/dummy_clid.db
	cd /afs/cern.ch/work/d/diboye/diallo_new/PhysicsAnalysis/AnalysisCam/GeneralCamAlgs && ../../../atlas_build_run.sh genCLIDDB -p GeneralCamAlgs -i /afs/cern.ch/work/d/diboye/diallo_new/PhysicsAnalysis/AnalysisCam/GeneralCamAlgs/dummy_clid.db -o /afs/cern.ch/work/d/diboye/diallo_new/PhysicsAnalysis/AnalysisCam/GeneralCamAlgs/GeneralCamAlgs_clid.db

GeneralCamAlgsClidGen: PhysicsAnalysis/AnalysisCam/GeneralCamAlgs/CMakeFiles/GeneralCamAlgsClidGen
GeneralCamAlgsClidGen: PhysicsAnalysis/AnalysisCam/GeneralCamAlgs/GeneralCamAlgs_clid.db
GeneralCamAlgsClidGen: PhysicsAnalysis/AnalysisCam/GeneralCamAlgs/CMakeFiles/GeneralCamAlgsClidGen.dir/build.make

.PHONY : GeneralCamAlgsClidGen

# Rule to build all files generated by this target.
PhysicsAnalysis/AnalysisCam/GeneralCamAlgs/CMakeFiles/GeneralCamAlgsClidGen.dir/build: GeneralCamAlgsClidGen

.PHONY : PhysicsAnalysis/AnalysisCam/GeneralCamAlgs/CMakeFiles/GeneralCamAlgsClidGen.dir/build

PhysicsAnalysis/AnalysisCam/GeneralCamAlgs/CMakeFiles/GeneralCamAlgsClidGen.dir/clean:
	cd /afs/cern.ch/work/d/diboye/diallo_new/PhysicsAnalysis/AnalysisCam/GeneralCamAlgs && $(CMAKE_COMMAND) -P CMakeFiles/GeneralCamAlgsClidGen.dir/cmake_clean.cmake
.PHONY : PhysicsAnalysis/AnalysisCam/GeneralCamAlgs/CMakeFiles/GeneralCamAlgsClidGen.dir/clean

PhysicsAnalysis/AnalysisCam/GeneralCamAlgs/CMakeFiles/GeneralCamAlgsClidGen.dir/depend:
	cd /afs/cern.ch/work/d/diboye/diallo_new && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /afs/cern.ch/work/d/diboye/ZdZdPostProcessing /afs/cern.ch/work/d/diboye/ZdZdPostProcessing/PhysicsAnalysis/AnalysisCam/GeneralCamAlgs /afs/cern.ch/work/d/diboye/diallo_new /afs/cern.ch/work/d/diboye/diallo_new/PhysicsAnalysis/AnalysisCam/GeneralCamAlgs /afs/cern.ch/work/d/diboye/diallo_new/PhysicsAnalysis/AnalysisCam/GeneralCamAlgs/CMakeFiles/GeneralCamAlgsClidGen.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : PhysicsAnalysis/AnalysisCam/GeneralCamAlgs/CMakeFiles/GeneralCamAlgsClidGen.dir/depend
