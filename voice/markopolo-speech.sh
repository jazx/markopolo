#!/bin/bash

aplay `ls ./$1/* | shuf -n 1`
