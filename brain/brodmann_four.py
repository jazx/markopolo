#!/usr/bin/env python3

import subprocess
import os

def ejecutar(tags,ingreso,user):

	resultado = ''
	resultado = resultado.encode("utf-8")
	
	#definiendo el nombre del archivo para ejecutar
	tagscom = tags.replace('<','+')
	tagscom = tagscom.replace('>','+')
	tagsexec = '../hand/'+tagscom
	
	#funcion para ejecutar comando
	def runing(tagsfile,ingreso,user):
		tagsexec_args = tagsfile+' '+user+' '+ingreso
		outputcomando = subprocess.run(tagsexec_args, stdout=subprocess.PIPE, shell=True)
		resultado = outputcomando.stdout	
		print('Exec:',tagsexec_args)
		print(' >>>:',resultado)
		return resultado		
		
	# revisa si existe un ejecutable que se corresponda a las tags ingresadas
	if os.path.exists(tagsexec):
		resultado = runing(tagsexec,ingreso,user)
	else:
		print('File <',tagsexec,'> not found. Running +NOTAGS+')
		tagsexec = '../hand/+NOTAGS+'
		resultado = runing(tagsexec,ingreso,user)
			
	return resultado
