#!/bin/bash - 
#===============================================================================
#
#          FILE: volumenotify.sh
# 
#         USAGE: ./volumenotify.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Migi (.), .
#  ORGANIZATION: .
#       CREATED: 03/26/2022 04:57:33 PM
#      REVISION:  ---
#===============================================================================
dunstify -r 11 -t 1000 Volume- $(amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $2 }')




