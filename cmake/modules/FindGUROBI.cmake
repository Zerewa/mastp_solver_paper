if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
	set(GUROBI_ROOT_DIR "/opt/gurobi1000/linux64")
	find_path(GUROBI_INCLUDE_DIR gurobi_c++.h HINTS "${GUROBI_ROOT_DIR}/include")
	find_library(GUROBI_LIBRARY libgurobi100.so HINTS ${GUROBI_ROOT_DIR}/lib)
	find_library(GUROBI_CPP_LIBRARY libgurobi_c++.a HINTS ${GUROBI_ROOT_DIR}/lib)
else()
	set(GUROBI_ROOT_DIR "C:/gurobi1000/win64/")
	find_path(GUROBI_INCLUDE_DIR gurobi_c++.h HINTS "${GUROBI_ROOT_DIR}/include")
	find_library(GUROBI_LIBRARY gurobi100.lib HINTS ${GUROBI_ROOT_DIR}/lib)
	find_library(GUROBI_CPP_LIBRARY gurobi_c++mdd2017.lib HINTS ${GUROBI_ROOT_DIR}/lib)
endif()


include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GUROBI DEFAULT_MSG GUROBI_LIBRARY GUROBI_CPP_LIBRARY GUROBI_INCLUDE_DIR)

#if(GUROBI_FOUND)
    set(GUROBI_INCLUDE_DIRS ${GUROBI_INCLUDE_DIR})
    set(GUROBI_LIBRARIES ${GUROBI_CPP_LIBRARY} ${GUROBI_LIBRARY})
    if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
        set(GUROBI_LIBRARIES "${GUROBI_LIBRARIES};m;pthread")
    endif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
#endif(GUROBI_FOUND)

mark_as_advanced(GUROBI_LIBRARY GUROBI_CPP_LIBRARY GUROBI_INCLUDE_DIR)
