#!/usr/bin/env python3

import subprocess

def reflex (cominput):

	response = ['go','nada-que-motrar']

	#procesando reflejos
	f = open("commands.conf", "r")
		
	for linea in f:
		
		reflejo = linea.split('=')
		codigo = reflejo[0]
		
		if(cominput == codigo):

			print('Spinal Reflex ACTIVE')
			comando = reflejo[1]
			
			outputcomando = subprocess.run(comando, stdout=subprocess.PIPE, shell=True)
			salida = outputcomando.stdout
			
			print('Recived: ',codigo)
			print('Exec:',comando,'>>>:',salida)
			print('')
			
			response = ['stop',salida]
	
	f.close()
	
	return response
