#!/bin/bash

# Hardcoded monitor names? 
dp_monitor="DP-1-4"
hdmi_monitor="HDMI-1-0"
laptop_screen="eDP1"

# Check which monitors are connected
monitors=$(xrandr -q | grep " connected" | cut -d" " -f1)

# Dumb shit for now. Fix DP refresh rate issues
xrandr --auto
if [ $(echo "$monitors" | grep $dp_monitor) ]; then 
    xrandr --output $dp_monitor --mode 1920x1080 --rate 143.98
fi 

# Count the number of connected monitors
num_monitors=$(echo "$monitors" | wc -l)

# Arrange the monitors
if [ $num_monitors -eq 2 ] 
then 
    # Only one monitor is connected. Put it above the laptop screen
    xrandr --output $monitors --above $laptop_screen
    echo "1 on"

elif [ $(echo "$monitors" | grep -c -e $dp_monitor -e $hdmi_monitor) -eq 2 ]
then 
    # Both are connected. Put DP-1-4 above eDP1 and to the left of HDMI-1-0 
    xrandr --output $dp_monitor --above $laptop_screen \
    --output $hdmi_monitor --right-of $dp_monitor 
    echo "2 on"
fi

# handle polybars. kinda coupled for now.. 
launch_polybar.sh