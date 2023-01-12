#!/bin/bash
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./client/sample_libcrypto/
make -f buid.make Client