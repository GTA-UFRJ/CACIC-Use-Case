#!/bin/bash
SGX_PATH=$1
CPP_HTTPLIB_PATH=$2

source $SGX_PATH
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./client/sample_libcrypto/
make -f buid.make \
server_enclave.signed.so \
Server \
DEBUG_PRINT=0 \
TOKENS_PATH="~/server/tokens" \
SERVER_PORT=8080 \
HTTPLIB_PATH=$CPP_HTTPLIB_PATH \
SEALS_PATH="~/server/seals" \
DB_PATH="~/databse/taciot.db"