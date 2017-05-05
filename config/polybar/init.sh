killall -q polybar
echo `hostname`

if [[ `hostname` = laptap ]]
then
  MONITOR=eDP1 polybar top
else
MONITOR=DVI-D-0 polybar top &
MONITOR=DVI-I-1 polybar top &
MONITOR=HDMI-0  polybar top &
fi
