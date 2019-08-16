#SET_DIRECTORY_PROPERTIES(PROPERTIES CLEAN_NO_CUSTOM true)
OPENCOG_ADD_ATOM_TYPES(
	atom_types.script
	atom_types.h
	atom_types.definitions
	atom_types.inheritance
	distv_types.scm
	distv_types.pyx
)
ADD_CUSTOM_TARGET(distv_atom_types DEPENDS atom_types.h)

# The atom_types.h file is written to the build directory
INCLUDE_DIRECTORIES(${CMAKE_BINARY_DIR})

ADD_LIBRARY (distv-types SHARED
	atom_types
	DistVTypes
)

TARGET_LINK_LIBRARIES(distv-types
	${ATOMSPACE_LIBRARIES}
)

# Without this, parallel make will race and crap up the generated files.
ADD_DEPENDENCIES(distv-types distv_atom_types)

IF (WIN32)
    INSTALL (TARGETS distv-types
		DESTINATION "lib${LIB_DIR_SUFFIX}/opencog")
ELSE (WIN32)
    INSTALL (TARGETS distv-types
		LIBRARY DESTINATION "lib${LIB_DIR_SUFFIX}/opencog")
ENDIF (WIN32)

INSTALL (FILES
	${CMAKE_CURRENT_BINARY_DIR}/atom_types.h
	DESTINATION "include/${PROJECT_NAME}/types"
)

ADD_GUILE_MODULE (FILES
	${CMAKE_CURRENT_BINARY_DIR}/distv_types.scm
	MODULE_DESTINATION "${GUILE_SITE_DIR}/opencog/distv/types"
	DEPENDS distv_atom_types
)

ADD_GUILE_EXTENSION(SCM_CONFIG distv-types "opencog-ext-path-distv-types")
