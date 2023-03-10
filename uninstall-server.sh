#!/bin/bash
DIR="./backup/"
if [ ! -d "$DIR" ]; then
    echo "Creating backup directory"
    mkdir ./backup
else
    echo "Backup directory alredy exists"
fi

make -f build.make clean_server
rm config_macros.h
mv ./database/taciot.db "./backup/taciot-$(date '+%F-%H-%M-%S').db"
rm ./server/server_app/server_database_config
rm ./server/server_app/server_database_config.o
rm ./server/seals/ck_*