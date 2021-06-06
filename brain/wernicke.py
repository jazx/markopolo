#!/usr/bin/env python3

import dicc
import brodmann_four

def procesar (ingreso,user):
	
	#ponemos todo en minusculas
	ingreso = ingreso.lower()
	
	tags = dicc.tagcreator(ingreso)
	
	print("Recived: %s" % ingreso)
	print("User: %s" % user)
	print("Tags: %s" % tags)
	
	salida = brodmann_four.ejecutar(tags,ingreso,user)

	print('')
	
	return salida
