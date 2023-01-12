#!/bin/bash
CPP_HTTPLIB_PATH=$1

root=$PWD
cd graphical-client

qmake -project
sed -i "19 i QT += core gui widgets" graphical-client.pro 
sed -i "40 i HEADERS += ${root}/client/cli.h ${root}/client/client_publish.h ${root}/client/client_query.h ${root}/client/client_revoke.h ${root}/client/client_permdb_manager.h ${root}/client/client_key_manager.h ${root}/client/client_apnet.h ${root}/client/client_uenet.h ${root}/client/client_register.h ${root}/client/client_generic_interface_dumb.h ${root}/utils/utils.h ${root}/utils/encryption.h ${root}/utils/errors.h ${root}/benchmark/timer.h ${root}/config_macros.h ${root}/sample_libcrypto/sample_libcrypto.h" graphical-client.pro 
sed -i "51 i SOURCES += ${root}/client/client_publish.cpp ${root}/client/client_query.cpp ${root}/client/client_revoke.cpp ${root}/client/client_permdb_manager.cpp ${root}/client/client_key_manager.cpp ${root}/client/client_apnet.cpp ${root}/client/client_uenet.cpp ${root}/client/client_register.cpp ${root}/client/client_generic_interface_dumb.cpp ${root}/utils/utils.cpp ${root}/utils/encryption.cpp ${root}/utils/errors.cpp ${root}/benchmark/timer.cpp" graphical-client.pro 

qmake
sed -i "20 i CXXFLGAS += -shared" Makefile
sed -i "22 i INCPATH += -I${root} -I${root}/client -I${root}/utils -I${root}/sample_libcrypto -I${root}/cpp-httplib -I${root}/benchmark" Makefile
sed -i "46 i LIBS += -lsqlite3 -lsample_libcrypto -L${root}/sample_libcrypto -Wl,-rpath=${root}/sample_libcrypto" Makefile
sed -i "90 i SOURCES += ${root}/client/client_publish.cpp ${root}/client/client_query.cpp ${root}/client/client_revoke.cpp ${root}/client/client_permdb_manager.cpp ${root}/client/client_key_manager.cpp ${root}/client/client_apnet.cpp ${root}/client/client_uenet.cpp ${root}/client/client_register.cpp ${root}/client/client_generic_interface_dumb.cpp ${root}/utils/utils.cpp ${root}/utils/encryption.cpp ${root}/utils/errors.cpp ${root}/benchmark/timer.cpp" Makefile

make
cp graphical-client ${root}/CACIC-GUI