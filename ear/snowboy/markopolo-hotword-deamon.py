#!/usr/bin/env python3

import snowboydecoder


def detected_callback():
    print ("Hotword Detected. Runing 'touch sb.touch' in MarkoPolo Listener directory...")
    #exit()

detector = snowboydecoder.HotwordDetector("hotword.pmdl", sensitivity=0.5, audio_gain=1)

detector.start(detected_callback)
