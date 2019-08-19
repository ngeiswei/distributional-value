DECLARE_GUILE_CONFIG_TARGET(SCM_CONFIG "opencog distv-config" "DISTV_TEST")

ADD_SUBDIRECTORY(types)
ADD_SUBDIRECTORY(distvalue)
ADD_SUBDIRECTORY(pln)
ADD_SUBDIRECTORY(scm)

WRITE_GUILE_CONFIG(${GUILE_BIN_DIR}/opencog/distv-config.scm SCM_CONFIG TRUE)
WRITE_GUILE_CONFIG(${GUILE_BIN_DIR}/opencog/distv-config-installable.scm SCM_CONFIG FALSE)
INSTALL(FILES ${GUILE_BIN_DIR}/opencog/distv-config-installable.scm DESTINATION ${GUILE_SITE_DIR}/opencog RENAME distv-config.scm)
