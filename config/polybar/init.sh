killall -q polybar
echo `hostname`

if [[ `hostname` = laptap ]]
then
    export DPI=230
    export POLYBAR_HEIGHT=65
    export POLYBAR_TRAY_SIZE=35
    polybar top
  else
    export DPI=100
    export POLYBAR_HEIGHT=30
    export POLYBAR_TRAY_SIZE=18
    MONITOR=DVI-D-0 polybar top &
    MONITOR=DVI-I-1 polybar top &
    MONITOR=HDMI-0  polybar top &
  fi
    MONITOR=eDP1 polybar top &
    MONITOR=DP1 polybar top &
