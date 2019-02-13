# Install script for directory: /afs/cern.ch/work/d/diboye/ZdZdPostProcessing/PhysicsAnalysis/AnalysisCam/AnalysisCamTools/GeneralCamTools

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/src/PhysicsAnalysis/AnalysisCam/AnalysisCamTools/GeneralCamTools" TYPE DIRECTORY FILES "/afs/cern.ch/work/d/diboye/ZdZdPostProcessing/PhysicsAnalysis/AnalysisCam/AnalysisCamTools/GeneralCamTools/" USE_SOURCE_PERMISSIONS REGEX "/\\.svn$" EXCLUDE REGEX "/\\.git$" EXCLUDE REGEX "/[^/]*\\~$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xMainx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process( COMMAND ${CMAKE_COMMAND}
      -E make_directory
      $ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/include )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xMainx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process( COMMAND ${CMAKE_COMMAND}
         -E create_symlink ../src/PhysicsAnalysis/AnalysisCam/AnalysisCamTools/GeneralCamTools/GeneralCamTools
         $ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/include/GeneralCamTools )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDebugx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE FILE OPTIONAL FILES "/afs/cern.ch/work/d/diboye/diallo_new/x86_64-slc6-gcc62-opt/lib/libGeneralCamToolsLib.so.dbg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xMainx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY OPTIONAL FILES "/afs/cern.ch/work/d/diboye/diallo_new/x86_64-slc6-gcc62-opt/lib/libGeneralCamToolsLib.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libGeneralCamToolsLib.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libGeneralCamToolsLib.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/cvmfs/sft.cern.ch/lcg/releases/binutils/2.28-19981/x86_64-slc6-gcc62-opt/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libGeneralCamToolsLib.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDebugx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE FILE OPTIONAL FILES "/afs/cern.ch/work/d/diboye/diallo_new/x86_64-slc6-gcc62-opt/lib/libGeneralCamTools.so.dbg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xMainx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE MODULE OPTIONAL FILES "/afs/cern.ch/work/d/diboye/diallo_new/x86_64-slc6-gcc62-opt/lib/libGeneralCamTools.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libGeneralCamTools.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libGeneralCamTools.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/cvmfs/sft.cern.ch/lcg/releases/binutils/2.28-19981/x86_64-slc6-gcc62-opt/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libGeneralCamTools.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xMainx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/python/GeneralCamTools" TYPE FILE OPTIONAL FILES "/afs/cern.ch/work/d/diboye/diallo_new/x86_64-slc6-gcc62-opt/python/GeneralCamTools/GeneralCamToolsConf.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xMainx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process( COMMAND ${CMAKE_COMMAND} -E touch
      $ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/python/GeneralCamTools/__init__.py )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xMainx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/jobOptions/GeneralCamTools" TYPE DIRECTORY FILES "/afs/cern.ch/work/d/diboye/ZdZdPostProcessing/PhysicsAnalysis/AnalysisCam/AnalysisCamTools/GeneralCamTools/share/configs" USE_SOURCE_PERMISSIONS REGEX "/\\.svn$" EXCLUDE)
endif()

