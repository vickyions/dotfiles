#!/bin/bash
DISPLAY=:0 feh --bg-fill $(find /home/migi/Wallpapers/wallrandom/wallhaven -type f | shuf -n 1)
