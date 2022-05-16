#!/bin/sh 
pkill picom
sleep 5s
picom --backend glx --glx-fshader-win "$(cat /home/migi/.config/picom/grayscale.glsl)" & disown

