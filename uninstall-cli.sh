#!/bin/bash
make -f build.make clean_client
rm config_macros.h
mv ./database/default_permissions.db "./backup/default_permissions-$(date '+%F-%H-%M-%S').db"
rm ./client/client_permdb_config
rm ./client/client_permdb_config.o