#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "WorkDir::AnalysisCamEventLib" for configuration "RelWithDebInfo"
set_property(TARGET WorkDir::AnalysisCamEventLib APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(WorkDir::AnalysisCamEventLib PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELWITHDEBINFO "EventInfo"
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libAnalysisCamEventLib.so"
  IMPORTED_SONAME_RELWITHDEBINFO "libAnalysisCamEventLib.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS WorkDir::AnalysisCamEventLib )
list(APPEND _IMPORT_CHECK_FILES_FOR_WorkDir::AnalysisCamEventLib "${_IMPORT_PREFIX}/lib/libAnalysisCamEventLib.so" )

# Import target "WorkDir::AnalysisCamEvent" for configuration "RelWithDebInfo"
set_property(TARGET WorkDir::AnalysisCamEvent APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(WorkDir::AnalysisCamEvent PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libAnalysisCamEvent.so"
  IMPORTED_NO_SONAME_RELWITHDEBINFO "TRUE"
  )

list(APPEND _IMPORT_CHECK_TARGETS WorkDir::AnalysisCamEvent )
list(APPEND _IMPORT_CHECK_FILES_FOR_WorkDir::AnalysisCamEvent "${_IMPORT_PREFIX}/lib/libAnalysisCamEvent.so" )

# Import target "WorkDir::AnalysisCamROOTLib" for configuration "RelWithDebInfo"
set_property(TARGET WorkDir::AnalysisCamROOTLib APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(WorkDir::AnalysisCamROOTLib PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libAnalysisCamROOTLib.so"
  IMPORTED_SONAME_RELWITHDEBINFO "libAnalysisCamROOTLib.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS WorkDir::AnalysisCamROOTLib )
list(APPEND _IMPORT_CHECK_FILES_FOR_WorkDir::AnalysisCamROOTLib "${_IMPORT_PREFIX}/lib/libAnalysisCamROOTLib.so" )

# Import target "WorkDir::GeneralCamToolsLib" for configuration "RelWithDebInfo"
set_property(TARGET WorkDir::GeneralCamToolsLib APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(WorkDir::GeneralCamToolsLib PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libGeneralCamToolsLib.so"
  IMPORTED_SONAME_RELWITHDEBINFO "libGeneralCamToolsLib.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS WorkDir::GeneralCamToolsLib )
list(APPEND _IMPORT_CHECK_FILES_FOR_WorkDir::GeneralCamToolsLib "${_IMPORT_PREFIX}/lib/libGeneralCamToolsLib.so" )

# Import target "WorkDir::GeneralCamTools" for configuration "RelWithDebInfo"
set_property(TARGET WorkDir::GeneralCamTools APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(WorkDir::GeneralCamTools PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libGeneralCamTools.so"
  IMPORTED_NO_SONAME_RELWITHDEBINFO "TRUE"
  )

list(APPEND _IMPORT_CHECK_TARGETS WorkDir::GeneralCamTools )
list(APPEND _IMPORT_CHECK_FILES_FOR_WorkDir::GeneralCamTools "${_IMPORT_PREFIX}/lib/libGeneralCamTools.so" )

# Import target "WorkDir::GeneralCamAlgs" for configuration "RelWithDebInfo"
set_property(TARGET WorkDir::GeneralCamAlgs APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(WorkDir::GeneralCamAlgs PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libGeneralCamAlgs.so"
  IMPORTED_NO_SONAME_RELWITHDEBINFO "TRUE"
  )

list(APPEND _IMPORT_CHECK_TARGETS WorkDir::GeneralCamAlgs )
list(APPEND _IMPORT_CHECK_FILES_FOR_WorkDir::GeneralCamAlgs "${_IMPORT_PREFIX}/lib/libGeneralCamAlgs.so" )

# Import target "WorkDir::ZdZdPlotting" for configuration "RelWithDebInfo"
set_property(TARGET WorkDir::ZdZdPlotting APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(WorkDir::ZdZdPlotting PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libZdZdPlotting.so"
  IMPORTED_NO_SONAME_RELWITHDEBINFO "TRUE"
  )

list(APPEND _IMPORT_CHECK_TARGETS WorkDir::ZdZdPlotting )
list(APPEND _IMPORT_CHECK_FILES_FOR_WorkDir::ZdZdPlotting "${_IMPORT_PREFIX}/lib/libZdZdPlotting.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
