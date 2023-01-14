#!/bin/bash
rm CACIC-GUI
rm config_macros.h
cd graphical-client
make clean
rm .qmake.stash graphical-client.pro Makefile
rm *.o 