#!/bin/sh

usererresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

#####Loading .Xresources settings
#xrdb -merge ~/.Xresources

####qbittorent and QT5 HiDPI fix
#export QT_FONT_DPI = 96 vym
######

#Autostart
#xbindkeys &
sxhkd &
dunst &
#stalonetray &
picom --experimental-backend &
#calcurse --daemon &
#udiskie -as &
nm-applet &
cbatticon &
xfce4-clipman &
#blueman-applet &
thunar --daemon &
#riseup-vpn &
buckle -g 45 &
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
captstatusui -P LBP2900B -e &
playerctld daemon &
#activity Watch
zeal &
#aw-qt &
#conky | while read -r; do xsetroot -name "$REPLY"; done &
wal -R
sh /home/migi/.conky/test/conky_slate.sh &
exec herbstluftwm

#DWM is set default
#start with command- xinit (session) 
#or - satrtx ~/.xinitrc (session)
#exec dwm

#session=${1:-dwm}
#
#case $session in
#	xfce|xfce4		) exec startxfce4;;
#	budgie			) exec budgie-desktop;;
#	openbox			) exec openbox-session;;
#       dwm			) exec dwm;;
#	herbstluftwm|hlwm	) exec herbstluftwm;;
#	bspwm			) exec bspwm;;
#	flwm			) exec flwm;;
#	fvwm			) exec fvwm;;
#	#No known session, try to run it as command
#	*			) exec $1;;
#esac


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
