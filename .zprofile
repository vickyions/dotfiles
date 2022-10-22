#
#~/.zprofile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ ! $DISPLAY && $XDG_VTNR == 1 ]]; then
	exec startx
fi

export PATH="$PATH:/home/migi/.local/bin"

######
