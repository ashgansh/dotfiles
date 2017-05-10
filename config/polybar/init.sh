killall -q polybar
echo `hostname`

if [[ `hostname` = laptap ]]
then
    export MONITOR=eDP1
    export DPI=230
    export POLYBAR_HEIGHT=65
    export POLYBAR_TRAY_SIZE=35
    polybar top
else
  MONITOR=DVI-D-0 polybar top &
  MONITOR=DVI-I-1 polybar top &
  MONITOR=HDMI-0  polybar top &
fi
