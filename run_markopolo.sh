#!/bin/bash

echo '--> Iniciando el servidor Brain'
cd brain
screen -c ../config/screen_conf -S markopolo_brain -d -m ./markopolo.py

cd ..
echo '--> Iniciando el cliente Markopolo Ear'
cd ear
./init_markopoloear.sh

