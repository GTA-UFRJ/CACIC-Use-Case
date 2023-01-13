#!/bin/bash
SGX_PATH=$1
CPP_HTTPLIB_PATH=$2

source $SGX_PATH
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PWD/sample_libcrypto/
make -f build.make \
server_enclave.signed.so \
Server \
DEBUG_PRINT=0 \
ENCLAVE_PATH="${PWD}/server_enclave.signed.so" \
TOKENS_PATH="${PWD}/server/tokens" \
SERVER_PORT=8080 \
HTTPLIB_PATH="${CPP_HTTPLIB_PATH}/httplib.h" \
HTTPLIB_DIR=$CPP_HTTPLIB_PATH \
SEALS_PATH="${PWD}/server/seals" \
DB_PATH="${PWD}/databse/taciot.db"