#!/bin/bash

#identifica el directorio donde estan los archivos
basedir=`readlink -e $0 | sed 's:\/[^\/]*$::g'`


echo '  > Server python para Ear'
cd $basedir/ear/webclient
#ejecuta el servidor
screen -c ../../config/screen_conf -S markopolo_webclient -d -m python3 -m http.server 9081

echo '  > Abriendo navegador Google Chrome'
google-chrome --app=http://localhost:9081/listener.html 2&> /dev/null &
while [ -z "`wmctrl -l | grep 'Markopolo Ear'`" ];do echo -n "." ; sleep 0.15 ; done ; echo '.'

echo '  > Ubicando ventana' 
#identifica el id de la ventana
WIN=`wmctrl -l | grep "Markopolo Ear" | awk '{print $1}'`
# define ubicacion y tamaño de la ventana de google-chrome
wmctrl -R 'Markopolo Ear' -e 0,0,0,500,200 

echo '  > Borrando la cache del navegador'
rm -Rf /home/$USER/.cache/google-chrome

echo '  > Activa el sonido de la ventana'
# simula ClICK sobre el navegador
xdotool mousemove 600 15 ; xdotool click 1
