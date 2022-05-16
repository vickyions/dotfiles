#!/usr/bin/env sh

#########################
#Author- Migi
#File Path-~/.config/scripts/unsplashrandomwall.sh
#Created(timestamp)- sat 12.06.21 08:30 PM
#
#
#Description- downloads random walls from unsplash for 1366x768 size using curl and cut
#and set using nitrogen
#########################
file="~/.config/scripts/counts/randomwall.cnt"

< ${file} read count

((count++))

echo ${count} > ${file}

echo "######################Start######################"

echo "Script ran ${count} times now (all included succesfull/unsuccesfull)."
echo "Pulling a random Image from Unsplash."

curl -#  $(curl --no-progress-meter --retry 3 --max-time 90 -C -  https://source.unsplash.com/random/1366x768 | cut -d\" -f2) --output /tmp/randomwall

echo "Setting the Wallpaper"


DISPLAY=:0 feh --bg-fill /tmp/randomwall

mv /tmp/randomwall ~/Wallpapers/randomUnsplash/#${count}-$(date "+%d.%m.%Y-%T").jpg

echo "######################Done######################"

