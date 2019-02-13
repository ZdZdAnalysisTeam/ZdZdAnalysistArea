# Install script for directory: /afs/cern.ch/work/d/diboye/diallo_new/ZdZdPostProcessing/ZdZdPlotting

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/InstallArea/x86_64-slc6-gcc62-opt")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xMainx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/ZdZdPlotting" TYPE DIRECTORY FILES "/afs/cern.ch/work/d/diboye/diallo_new/ZdZdPostProcessing/ZdZdPlotting/" USE_SOURCE_PERMISSIONS REGEX "/\\.svn$" EXCLUDE REGEX "/\\.git$" EXCLUDE REGEX "/[^/]*\\~$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDebugx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE FILE OPTIONAL FILES "/afs/cern.ch/work/d/diboye/diallo_new/build/x86_64-slc6-gcc62-opt/lib/libZdZdPlotting.so.dbg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xMainx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE MODULE OPTIONAL FILES "/afs/cern.ch/work/d/diboye/diallo_new/build/x86_64-slc6-gcc62-opt/lib/libZdZdPlotting.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libZdZdPlotting.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libZdZdPlotting.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/cvmfs/sft.cern.ch/lcg/releases/binutils/2.28-19981/x86_64-slc6-gcc62-opt/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libZdZdPlotting.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xMainx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/python/ZdZdPlotting" TYPE FILE OPTIONAL FILES "/afs/cern.ch/work/d/diboye/diallo_new/build/x86_64-slc6-gcc62-opt/python/ZdZdPlotting/ZdZdPlottingConf.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xMainx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process( COMMAND ${CMAKE_COMMAND} -E touch
      $ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/python/ZdZdPlotting/__init__.py )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xMainx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/data/ZdZdPlotting" TYPE FILE RENAME "crossSections.txt" FILES "/afs/cern.ch/work/d/diboye/diallo_new/ZdZdPostProcessing/ZdZdPlotting/share/crossSections.txt")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xMainx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/data/ZdZdPlotting" TYPE FILE RENAME "signal_mc16a_crossSections.txt" FILES "/afs/cern.ch/work/d/diboye/diallo_new/ZdZdPostProcessing/ZdZdPlotting/share/signal_mc16a_crossSections.txt")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xMainx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/jobOptions/ZdZdPlotting" TYPE FILE RENAME "ZdZdPlottingAlgJobOptions.py" FILES "/afs/cern.ch/work/d/diboye/diallo_new/ZdZdPostProcessing/ZdZdPlotting/share/ZdZdPlottingAlgJobOptions.py")
endif()

