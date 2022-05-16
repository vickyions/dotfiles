#!/bin/bash
#pomodoro

recordTomato () {
notify-send "break"
mpv /usr/share/sounds/freedesktop/stereo/message.oga
exec 3>&1
didwhat=$(dialog --inputbox 'What did you do?' 0 0 2>&1 1>&3)
exitcode=$?;
exec 3>&-;
#dialog --infobox " you said $didwhat " 10 30 ; sleep 4
echo "`date +%D:%T`    Task: $didwhat" >> pomodoro.log
runBreak
}

runTomato () {
dialog --title "Pomodoro" --yesno "Do you want to start a tomato?" 0 0
exitcode=$?;
if [ $exitcode = 0 ] ; then
  seconds=3000;
  date1=$((`date +%s` + seconds));
while [ "$date1" -ge `date +%s` ];
do
  dialog --infobox "Work for $(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)" 10 30 ; sleep 1
done
recordTomato
else
  dialog --infobox "Thanks for playing the tomato game. " 0 0
  echo "done"
  exit 0
fi
}

runBreak () {
  seconds=300;
date1=$((`date +%s` + seconds));

while [ "$date1" -ge `date +%s` ];
do
  dialog --infobox "Nice work; you did:

  $didwhat

  Now you're on break!
  rest for $(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)" 0 0 ; sleep 1
done
notify-send "Start tomato"
mpv /usr/share/sounds/freedesktop/stereo/message.oga
runTomato
}

runTomato
