#!/bin/sh

usererresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

#####Loading .Xresources settings
xrdb -merge ~/.Xresources

###slow gtk application start
###https://bbs.archlinux.org/viewtopic.php?id=224787
###https://github.com/flatpak/xdg-desktop-portal-gtk/issues/72
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
####qbittorent and QT5 HiDPI fix
#export QT_FONT_DPI = 96 vym
######
#defaults
export TERM=alacritty
export TERMINAL=alacritty
export BROWSER=firefox
export EDITOR=vim
export QT_QPA_PLATFORMTHEME=qt5ct

######less###
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
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
#########
LS_COLORS=$LS_COLORS:'di=1;35:ln=36:so=32:pi=33:ex=31:bd=34;47:cd=34;43:su=30;41:sg=30;45:tw=30;42:ow=30;43' ; export LS_COLORS
#########


#Autostart
#xbindkeys &
sxhkd &
dunst &
#stalonetray &
xfce4-power-manager &
#picom --experimental-backend &
picom &
#calcurse --daemon &
#udiskie -as &
#nm-applet &
#cbatticon &
xfce4-clipman &
#blueman-applet &
#thunar --daemon &
#riseup-vpn &
#buckle -g 45 &
#keepassxc &
#nitrogen --restore &
#birdtray &
#joplin.appimage &
#pulseeffects &
#hexchat &
#goldendict &
#termite -e "irssi -c Freenode" &
#exec /usr/lib/kdeconnectd &
#kdeconnect-indicator &
#syncthing-gtk -m &
#telegram-desktop &
#captstatusui -P LBP2900B -e &
#playerctld daemon &
#activity Watch
#slack &
#zeal &
#aw-qt &
#conky | while read -r; do xsetroot -name "$REPLY"; done &
#wal -R &
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
#sh /home/migi/.conky/test/conky_slate.sh &
exec herbstluftwm

#DWM is set default
#start with command- xinit (session) 
#or - satrtx ~/.xinitrc (session)
#exec dwm

#merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

