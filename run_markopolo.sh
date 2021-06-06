#!/bin/bash

#identifica el directorio donde estan los archivos
basedir=`readlink -e $0 | sed 's:\/[^\/]*$::g'`


echo '--> Iniciando el servidor Brain'
cd $basedir/brain
screen -c ../config/screen_conf -S markopolo_brain -d -m ./markopolo.py



echo '--> Abriendo Markopolo Webclient'
echo '  > Activando snowboy'
cd $basedir/ear/snowboy
rm /tmp/snowboystop 2> /dev/null
screen -c ../../config/screen_conf -S markopolo_snowboy -d -m ./markopolo-hotword-deamon.py

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
#quita la decoracion de la ventana
#####  xprop -id $WIN -f _MOTIF_WM_HINTS 32c -set _MOTIF_WM_HINTS "0x2, 0x0, 0x0, 0x0, 0x0" # no funciona en xfce4 
#####  utilizando la aplicacion decoration-off
$basedir/ear/decoration-control/decoration-off $WIN
# establece condiciones para la ventana del navegador
wmctrl -R 'Markopolo Ear' -b add,sticky 
wmctrl -R 'Markopolo Ear' -b add,above 
wmctrl -R 'Markopolo Ear' -b add,skip_taskbar
# identifica el ancho de la pantalla para colocar el ancho de la ventana
ANCHO=`xrandr | grep '*' | awk '{print $1}' | sed 's/x.*$//g'`
# define ubicacion y tamaño de la ventana de google-chrome
wmctrl -R 'Markopolo Ear' -e 0,0,0,$ANCHO,45 
# en xfce4 agrega un margen de 45 pixeles en la parte superior
xfconf-query -c xfwm4 -p /general/margin_top -s 45

echo '  > Borrando la cache del navegador'
rm -Rf /home/$USER/.cache/google-chrome

echo '  > Activa el sonido de la ventana'
# simula ClICK sobre el navegador
xdotool mousemove 600 15 ; xdotool click 1
