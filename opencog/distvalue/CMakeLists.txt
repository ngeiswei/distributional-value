INCLUDE_DIRECTORIES (
	${CMAKE_BINARY_DIR}       # for the distv atom types
)

ADD_LIBRARY (distvalue
	DVecUtils.cc
	CoverTree.cc
    CTHist.cc
	DistributionalValue.cc
	ConditionalDV.cc
	DVFormulas.cc
)

TARGET_LINK_LIBRARIES(distvalue
	distv-types
	${COGUTIL_LIBRARY}
)

INSTALL (TARGETS distvalue
	EXPORT DISTVTargets
	DESTINATION "lib${LIB_DIR_SUFFIX}/opencog"
)

INSTALL (FILES
	DVecUtils.h
	CoverTree.h
	CTHist.h
	DistributionalValue.h
	ConditionalDV.h
	DVFormulas.h
	DESTINATION "include/opencog/distvalue"
)

IF (HAVE_GUILE)
	ADD_LIBRARY (distv DistributionalValueSCM.cc)
	TARGET_LINK_LIBRARIES(distv distvalue smob)
	ADD_GUILE_EXTENSION(SCM_CONFIG distv "opencog-ext-path-distv")

	INSTALL (TARGETS distv
		EXPORT DISTVTargets
		DESTINATION "lib${LIB_DIR_SUFFIX}/opencog")
ENDIF (HAVE_GUILE)
