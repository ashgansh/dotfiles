killall -q polybar

if [[ `hostname` = laptap ]]
then
    export DPI=230
    export POLYBAR_HEIGHT=65
    export POLYBAR_TRAY_SIZE=35
    MONITOR=eDP1 polybar top &
    MONITOR=DP1 polybar top &
  elif [[ `hostname` = fms-laptop ]]
  then
    echo "hello"
    export DPI=100
    export POLYBAR_HEIGHT=24
    MONITOR=eDP-1 polybar top &
    MONITOR=HDMI-1 polybar top &
  fi
