file(REMOVE_RECURSE
  "../../../x86_64-slc6-gcc62-opt/include/AnalysisCamExample"
  "../../../x86_64-slc6-gcc62-opt/python/AnalysisCamExample/__init__.py"
  "../../../x86_64-slc6-gcc62-opt/jobOptions/AnalysisCamExample/AnalysisCamExampleAlgJobOptions.py"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/Package_AnalysisCamExample_tests.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
