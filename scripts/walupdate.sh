#!/bin/sh
pkill stalonetray
stalonetray -bg "$(xrdb -query | grep \*.background: | cut -f2 )" & disown
pywalfox update
wal-telegram --wal -g

