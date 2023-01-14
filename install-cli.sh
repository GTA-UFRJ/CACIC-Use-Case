#!/bin/bash
CPP_HTTPLIB_PATH=$1
AP_URL=$2
AP_PORT=$3
SERVER_URL=$4
SERVER_PORT=$5

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PWD/sample_libcrypto/

cp config_macros_template config_macros.h
python3 setup_macros_file.py "(ROOT)" "$PWD"
python3 setup_macros_file.py "(HTTPLIB)" "$CPP_HTTPLIB_PATH"
python3 setup_macros_file.py "(APURL)" "$AP_URL"
python3 setup_macros_file.py "(APPORT)" "$AP_PORT"
python3 setup_macros_file.py "(SERVERURL)" "$SERVER_URL"
python3 setup_macros_file.py "(SERVERPORT)" "$SERVER_PORT"

make -f build.make \
Client \ 
HTTPLIB_DIR=$CPP_HTTPLIB_PATH 
