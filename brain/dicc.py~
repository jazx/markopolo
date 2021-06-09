#!/usr/bin/env python3

import re

def tagcreator (intodicc):

	#procesando diccionario
	f = open("dictionary.conf", "r")
		
	for linea in f:

		#linea tiene el contenido de cada linea del diccionario
		contenido = linea.split('=')
		
		#define el tag a utilizar
		tag = contenido[0]
		
		# define las palabras incluidas en el tag
		# primero separa las palabras
		palabras = contenido[1].split('|')
		# luego borra el ultimo valor, que es \n
		palabras.pop()
		
		# 'print' usado para testear si el diccionario es leido como corresponde
		# desactivado por defecto
		#print(tag,' INCLUYE ', palabras)
		
		for word in palabras:
			intodicc = intodicc.replace(word, tag)

	f.close()
	
	#tags contiene todo lo procesado linea por linea
	tags = intodicc

	# borra lo que NO es tags
	# primero aisla las tags
	onlytags = re.sub('>([^<]*)<', '><', tags)
	onlytags = re.sub('(^[^<]*)<', '<', onlytags)
	onlytags = re.sub('(>[^>]*$)', '>', onlytags)

	# si no hubieron TAGS reemplaza todo por NOTAGS
	onlytags = re.sub('(^[^<].*$)', '<NOTAGS>', onlytags)

	return onlytags