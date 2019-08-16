ENABLE_TESTING()
INCLUDE(AddCxxtest)

ADD_DEFINITIONS(-DPROJECT_SOURCE_DIR="${CMAKE_SOURCE_DIR}"
                -DPROJECT_BINARY_DIR="${CMAKE_BINARY_DIR}")

# All tests should load the atomspace scm from the build dir, unless the scm
# file is specific to the test (this variable is used by ADD_CXXTEST)
SET(GUILE_LOAD_PATH "${PROJECT_BINARY_DIR}/opencog/scm")

IF (CXXTEST_FOUND)
	ADD_SUBDIRECTORY (distvalue)
ENDIF (CXXTEST_FOUND)
