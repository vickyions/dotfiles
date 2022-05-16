#!/bin/sh

bspc query -N -n focused.tiled > /dev/null && {
    bspc node -s "$1"
    exit
}

step=20

case $1 in
    east) x=$step; y=0;;
    west) x=-$step; y=0;;
    north) x=0; y=-$step;;
    south) x=0; y=$step;;
esac

bspc node -v "$x" "$y"

