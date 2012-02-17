SRC_DIR = source
BUILD_DIR = build
UGLIFY = uglifyjs --unsafe -nc
FOUNDRY_DIR = ../..
PRODUCTION_DIR = ${FOUNDRY_DIR}/scripts
DEVELOPMENT_DIR = ${FOUNDRY_DIR}/scripts_
MODULARIZE = ${FOUNDRY_DIR}/build/modularize
BASE_FILES = ${SRC_DIR}/jquery.bookmarklet.js

all: premake body min foundry

premake:
	mkdir -p ${BUILD_DIR}

body:
	@@cat ${BASE_FILES} > ${BUILD_DIR}/jquery.bookmarklet.js

min:
	${UGLIFY} ${BUILD_DIR}/jquery.bookmarklet.js > ${BUILD_DIR}/jquery.bookmarklet.min.js

foundry:
	${MODULARIZE} -n "bookmarklet" ${BUILD_DIR}/jquery.bookmarklet.js > ${DEVELOPMENT_DIR}/bookmarklet.js
	${UGLIFY} ${DEVELOPMENT_DIR}/bookmarklet.js > ${PRODUCTION_DIR}/bookmarklet.js




