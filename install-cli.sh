#!/bin/bash
CPP_HTTPLIB_PATH=$1

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PWD/sample_libcrypto/
make -f build.make \
Client \ 
HTTPLIB_PATH="${CPP_HTTPLIB_PATH}/httplib.h" \
HTTPLIB_DIR=$CPP_HTTPLIB_PATH