#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\W]\$ '

#export TERM=alacritty
#export BROWSER=firefox
#export EDITOR=vim

VBOX_USB=usbfs

#auto cd when its a path
#shopt -s autocd

##Commmand completion
#bash-completiton
#source /usr/share/bash-completion/bash_completion
###

###see READLINE for history completion and other 
###cool stuff

###History
#dont save cmd starting with space adn consecutive identical commands
export HISTCONTROL=ignoreboth
#disable history temporarily
#set +o history
#renable with
#set -o history

export HISTSIZE=1000
###

##cmd not found msg help
#source /usr/share/doc/pkgfile/command-not-found.bash

###nvm
source /usr/share/nvm/init-nvm.sh
###

###zoxide a better cd
eval "$(zoxide init bash)"

###using ble.sh
#source ~/.local/share/blesh/ble.sh
set -o vi
