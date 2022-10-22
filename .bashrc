#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ums='/opt/ums/UMS.sh'
PS1='[\u:\W]\$ '
VBOX_USB=usbfs

#export TERM=alacritty                                                   
#export RTV_BROWSER=librewolf
#export BROWSER=firefox
#export EDITOR=vim                         
#export QT_QPA_PLATFORMTHEME=qt5ct

#Alias
#alias sudo='doas'
alias ydl='youtube-dl'
alias music='mpv --playlist=mpvSongs.m3u --shuffle --loop-playlist'
alias hotspot='nmcli d wifi hotspot ssid migi password bhanjebeta'
alias rm='rm -i'
alias mkdir='mkdir -p -v'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias diff='colordiff'
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
#alias sys='systemctl'
#SelfAdded

#function _update_ps1() {
#    PS1=$(powerline-shell $?)
#}

#if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi

######less###
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
##########
#########less for man for coloured output######
man() {
	    LESS_TERMCAP_md=$'\e[01;31m' \
            LESS_TERMCAP_me=$'\e[0m' \
            LESS_TERMCAP_se=$'\e[0m' \
            LESS_TERMCAP_so=$'\e[01;44;33m' \
	    LESS_TERMCAP_ue=$'\e[0m' \
	    LESS_TERMCAP_us=$'\e[01;32m' \
	    command man "$@"
	}
###########

#########
LS_COLORS=$LS_COLORS:'di=1;35:ln=36:so=32:pi=33:ex=31:bd=34;47:cd=34;43:su=30;41:sg=30;45:tw=30;42:ow=30;43' ; export LS_COLORS
#########
source /usr/share/nvm/init-nvm.sh
