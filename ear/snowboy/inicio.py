#from flask import Flask
import snowboydecoder

print ('Esperando hotword')
    
def detected_callback():
	print ("Hotword Detected. Runing js seech recognition...")


detector = snowboydecoder.HotwordDetector("hotword.pmdl", sensitivity=0.5, audio_gain=1)
   	
detector.start(detected_callback)