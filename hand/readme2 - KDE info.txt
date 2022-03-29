######  Al parecer, el comando "notify-send" que figura en alguno de los scripts aqui presentes
######  no funciona en algunos escritorios KDE, cuando se usan las librerias Qt.

######  Un usuario muy amable ha buscado un codigo equivalente para esta funcion. Es el siguiente:



gdbus call --session --dest org.freedesktop.Notifications --object-path /org/freedesktop/Notifications --method org.freedesktop.Notifications.Notify "Markopolo" 0 "" 'Abriendo Youtube' '' \ '[]' '{"urgency": <1>}' 5000



###### (gracias argonach)
