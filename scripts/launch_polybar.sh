#!/bin/bash

# Kill all existing polybars 
if pgrep -x polybar > /dev/null; then 
  killall polybar
fi 

# Check which monitors are connected
monitors=$(xrandr -q | grep " connected" | cut -d" " -f1) 

# Launch polybar on each connected monitor 
for monitor in $monitors; do 
  MONITOR="$monitor" polybar bar1 & disown
done
