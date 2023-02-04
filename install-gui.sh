#!/bin/bash
CPP_HTTPLIB_PATH=$1
AP_URL=$2
AP_PORT=$3
SERVER_URL=$4
SERVER_PORT=$5

g++ -c client/client_permdb_config.cpp -o client/client_permdb_config.o
g++ client/client_permdb_config.o -l sqlite3 -o client/client_permdb_config
./client/client_permdb_config default_permissions.db

cp config_macros_template config_macros.h
python3 setup_macros_file.py "(ROOT)" "$PWD"
python3 setup_macros_file.py "(HTTPLIB)" "$CPP_HTTPLIB_PATH"
python3 setup_macros_file.py "(APURL)" "$AP_URL"
python3 setup_macros_file.py "(APPORT)" "$AP_PORT"
python3 setup_macros_file.py "(SERVERURL)" "$SERVER_URL"
python3 setup_macros_file.py "(SERVERPORT)" "$SERVER_PORT"

root=$PWD
cd graphical-client

qmake -project
sed -i "19 i QT += core gui widgets" graphical-client.pro 
sed -i "38 i HEADERS += ${root}/client/cli.h ${root}/client/client_publish.h ${root}/client/client_query.h ${root}/client/client_permdb_manager.h ${root}/client/client_key_manager.h ${root}/client/client_apnet.h ${root}/client/client_uenet.h ${root}/client/client_register.h ${root}/client/client_generic_interface.h ${root}/utils/utils.h ${root}/utils/encryption.h ${root}/utils/errors.h ${root}/benchmark/timer.h ${root}/config_macros.h" graphical-client.pro 
echo "SOURCES += ${root}/client/client_publish.cpp ${root}/client/client_query.cpp ${root}/client/client_permdb_manager.cpp ${root}/client/client_key_manager.cpp ${root}/client/client_apnet.cpp ${root}/client/client_uenet.cpp ${root}/client/client_register.cpp ${root}/client/client_generic_interface.cpp ${root}/utils/utils.cpp ${root}/utils/encryption.cpp ${root}/utils/errors.cpp ${root}/benchmark/timer.cpp" >> graphical-client.pro 

qmake
sed -i "20 i CXXFLGAS += -shared" Makefile
sed -i "22 i INCPATH += -I${root} -I${root}/client -I${root}/utils -I${root}/cpp-httplib -I${root}/benchmark" Makefile
sed -i "46 i LIBS += -lsqlite3 -lcrypto" Makefile
sed -i "87 i SOURCES += ${root}/client/client_publish.cpp ${root}/client/client_query.cpp ${root}/client/client_permdb_manager.cpp ${root}/client/client_key_manager.cpp ${root}/client/client_apnet.cpp ${root}/client/client_uenet.cpp ${root}/client/client_register.cpp ${root}/client/client_generic_interface.cpp ${root}/utils/utils.cpp ${root}/utils/encryption.cpp ${root}/utils/errors.cpp ${root}/benchmark/timer.cpp" Makefile

make \
HTTPLIB_DIR=$CPP_HTTPLIB_PATH 

mv graphical-client ${root}/CACIC-GUI