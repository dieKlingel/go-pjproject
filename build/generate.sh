#!/bin/bash

echo "Generating ..."

SCRIPT_DIR=$(dirname "$(realpath $0)")
PJPROJECT_DIR=$(realpath $SCRIPT_DIR/../3rdparty/pjproject)
OUT_DIR="$SCRIPT_DIR/../pjsua2"

CONFIG_FILE="$PJPROJECT_DIR/pjlib/include/pj/config_site.h"
if [ ! -f "$CONFIG_FILE" ]; then
	touch $CONFIG_FILE
fi

INCLUDES=""
for INCLUDE_PATH in $PJPROJECT_DIR/**/include; do
	INCLUDES="$INCLUDES -I$INCLUDE_PATH"
done
echo $INCLUDES

cd $OUT_DIR
swig -c++ -go -cgo -intgosize 64 -outcurrentdir $INCLUDES ../3rdparty/pjproject/pjsip-apps/src/swig/pjsua2.i
