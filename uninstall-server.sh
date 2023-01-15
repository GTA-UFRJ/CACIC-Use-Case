#!/bin/bash
make -f build.make clean_server
rm config_macros.h
mv ./database/taciot.db "./backup/taciot-$(date '+%F-%H-%M-%S').db"
rm ./server/server_app/server_database_config
rm ./server/server_app/server_database_config.o