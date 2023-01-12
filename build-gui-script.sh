#!/bin/bash
cd graphical-client

qmake -project
sed -i '19 i QT += core gui widgets' graphical-client.pro 
sed -i '40 i HEADERS += ../client/cli.h ../client/client_publish.h ../client/client_query.h ../client/client_revoke.h ../client/client_permdb_manager.h ../client/client_key_manager.h ../client/client_apnet.h ../client/client_uenet.h ../client/client_register.h ../client/client_generic_interface_dumb.h ../utils/utils.h ../utils/encryption.h ../utils/errors.h ../benchmark/timer.h ../config_macros.h ../sample_libcrypto/sample_libcrypto.h' graphical-client.pro 
sed -i '60 i SOURCES += ../client/client_publish.cpp ../client/client_query.cpp ../client/client_revoke.cpp ../client/client_permdb_manager.cpp ../client/client_key_manager.cpp ../client/client_apnet.cpp ../client/client_uenet.cpp ../client/client_register.cpp ../client/client_generic_interface_dumb.cpp ../utils/utils.cpp ../utils/encryption.cpp ../utils/errors.cpp ../benchmark/timer.cpp' graphical-client.pro 

qmake
sed -i '20 i CXXFLGAS += -shared' Makefile
sed -i '22 i INCPATH += -I.. -I../client -I../utils -I../sample_libcrypto -I../cpp-httplib -I../benchmark' Makefile
sed -i '46 i LIBS += -lsqlite3 -lsample_libcrypto -L../sample_libcrypto -Wl,-rpath=../sample_libcrypto' Makefile
sed -i '90 i SOURCES += ../client/client_publish.cpp ../client/client_query.cpp ../client/client_revoke.cpp ../client/client_permdb_manager.cpp ../client/client_key_manager.cpp ../client/client_apnet.cpp ../client/client_uenet.cpp ../client/client_register.cpp ../client/client_generic_interface_dumb.cpp ../utils/utils.cpp ../utils/encryption.cpp ../utils/errors.cpp ../benchmark/timer.cpp' Makefile

make
mv graphical-client ..