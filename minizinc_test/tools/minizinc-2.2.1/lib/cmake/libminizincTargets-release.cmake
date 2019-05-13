#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "minizinc_gurobi" for configuration "Release"
set_property(TARGET minizinc_gurobi APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(minizinc_gurobi PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libminizinc_gurobi.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS minizinc_gurobi )
list(APPEND _IMPORT_CHECK_FILES_FOR_minizinc_gurobi "${_IMPORT_PREFIX}/lib/libminizinc_gurobi.a" )

# Import target "minizinc" for configuration "Release"
set_property(TARGET minizinc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(minizinc PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C;CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libminizinc.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS minizinc )
list(APPEND _IMPORT_CHECK_FILES_FOR_minizinc "${_IMPORT_PREFIX}/lib/libminizinc.a" )

# Import target "minizinc_solver" for configuration "Release"
set_property(TARGET minizinc_solver APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(minizinc_solver PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libminizinc_solver.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS minizinc_solver )
list(APPEND _IMPORT_CHECK_FILES_FOR_minizinc_solver "${_IMPORT_PREFIX}/lib/libminizinc_solver.a" )

# Import target "minizinc_fzn" for configuration "Release"
set_property(TARGET minizinc_fzn APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(minizinc_fzn PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libminizinc_fzn.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS minizinc_fzn )
list(APPEND _IMPORT_CHECK_FILES_FOR_minizinc_fzn "${_IMPORT_PREFIX}/lib/libminizinc_fzn.a" )

# Import target "minizinc-bin" for configuration "Release"
set_property(TARGET minizinc-bin APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(minizinc-bin PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/minizinc"
  )

list(APPEND _IMPORT_CHECK_TARGETS minizinc-bin )
list(APPEND _IMPORT_CHECK_FILES_FOR_minizinc-bin "${_IMPORT_PREFIX}/bin/minizinc" )

# Import target "mzn2fzn" for configuration "Release"
set_property(TARGET mzn2fzn APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(mzn2fzn PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/mzn2fzn"
  )

list(APPEND _IMPORT_CHECK_TARGETS mzn2fzn )
list(APPEND _IMPORT_CHECK_FILES_FOR_mzn2fzn "${_IMPORT_PREFIX}/bin/mzn2fzn" )

# Import target "solns2out" for configuration "Release"
set_property(TARGET solns2out APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(solns2out PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/solns2out"
  )

list(APPEND _IMPORT_CHECK_TARGETS solns2out )
list(APPEND _IMPORT_CHECK_FILES_FOR_solns2out "${_IMPORT_PREFIX}/bin/solns2out" )

# Import target "mzn2doc" for configuration "Release"
set_property(TARGET mzn2doc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(mzn2doc PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/mzn2doc"
  )

list(APPEND _IMPORT_CHECK_TARGETS mzn2doc )
list(APPEND _IMPORT_CHECK_FILES_FOR_mzn2doc "${_IMPORT_PREFIX}/bin/mzn2doc" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
