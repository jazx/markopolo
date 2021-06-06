#!/bin/bash

echo '--> Cerrando Markopolo'
# cierra navegador
echo '--> Cerrando Ear (navegador)'
kill `ps aux | grep 'app=http://localhost:9081/listener.html' | grep -v grep | awk '{print $2}'` 2> /dev/null

echo '--> Cerrando Ear (pyserver)'
kill `ps aux | grep 'SCREEN -c ../../config/screen_conf -S markopolo_webclient -d -m python3 -m http.server 9081' | grep -v grep | awk '{print $2}'` 2> /dev/null

echo '--> Cerrando Brain'
kill `ps aux | grep 'SCREEN -c ../config/screen_conf -S markopolo_brain -d -m ./markopolo.py' | grep -v grep | awk '{print $2}'` 2> /dev/null

echo '--> Cerrando Snowboy'
kill `ps aux | grep 'SCREEN -c ../../config/screen_conf -S markopolo_snowboy -d -m ./markopolo-hotword-deamon.py' | grep -v grep | awk '{print $2}'` 2> /dev/null

#quitando margen superior en el workspace de xfce4 
xfconf-query -c xfwm4 -p /general/margin_top -s 0
