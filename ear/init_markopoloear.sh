#!/bin/bash

echo '--> Abriendo Markopolo Webclient'

echo '--> Activando snowboy'
cd snowboy
rm /tmp/snowboystop 2> /dev/null
screen -c ../../config/screen_conf -S markopolo_snowboy -d -m ./markopolo-hotword-deamon.py
cd ..

echo '--> Server python para Ear'
cd webclient
#ejecuta el servidor
screen -c ../../config/screen_conf -S markopolo_webclient -d -m python3 -m http.server 9081

echo '--> Abriendo navegador Google Chrome'
google-chrome --app=http://localhost:9081/listener.html 2&> /dev/null &
while [ -z "`wmctrl -l | grep 'Markopolo Ear'`" ];do echo -n "." ; sleep 0.15 ; done ; echo '.'

echo '--> Ubicando ventana' ; 
# en xfce4 agrega un margen de 45 pixeles en la parte superior
# xfconf-query -c xfwm4 -p /general/margin_top -s 45

WIN=`wmctrl -l | grep "Markopolo Ear" | awk '{print $1}'`
xprop -id $WIN -f _MOTIF_WM_HINTS 32c -set _MOTIF_WM_HINTS "0x2, 0x0, 0x0, 0x0, 0x0" 
wmctrl -R 'Markopolo Ear' -b add,sticky 
wmctrl -R 'Markopolo Ear' -b add,above 
wmctrl -R 'Markopolo Ear' -b add,skip_taskbar

# identifica el ancho de la pantalla para colocar el ancho de la ventana
ANCHO=`xrandr | grep '*' | awk '{print $1}' | sed 's/x.*$//g'`
wmctrl -R 'Markopolo Ear' -e 0,0,-3,$ANCHO,45 

echo '--> Borrando la cache del navegador'
rm -Rf /home/$USER/.cache/google-chrome

echo '--> Activa el sonido de la ventana'
# simula ClICK sobre el navegador
xdotool mousemove 600 15 ; xdotool click 1
