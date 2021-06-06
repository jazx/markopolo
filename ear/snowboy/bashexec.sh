#!/bin/bash

#borra la cache del navegador para que se actualice mas rapido la respuesta
rm -Rf /home/$USER/.cache/google-chrome


GO_FILE=../webclient/sb.touch


touchfile()
{
	touch $GO_FILE
	xset dpms force on
	sleep 1.5 ; rm $GO_FILE ; sleep 3
}


detiene_sb()
{
	touch /tmp/snowboystop
	sleep 6s
	rm /tmp/snowboystop
}


if [ ! -f /tmp/snowboystop ];then 

		aplay `ls ../../voice/ready/* | shuf -n 1`
		xset dpms force on
		#desactiva snowboy durante 6 segundos
		detiene_sb &
		touchfile

fi
