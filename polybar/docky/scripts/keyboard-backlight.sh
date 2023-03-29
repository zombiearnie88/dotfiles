#!/bin/bash
BRIGHTNESS_VALUE=`brightnessctl --device=smc::kbd_backlight | grep -o "(.*" | tr -d "()"`
BRIGHTNESS_NR=${BRIGHTNESS_VALUE//%}

if [ $BRIGHTNESS_NR -lt 20 ]; then
	BRIGHTNESS_ICON=''
elif [ $BRIGHTNESS_NR -lt 50 ]; then
	BRIGHTNESS_ICON='pf7e'
elif [ $BRIGHTNESS_NR -lt 80 ]; then
	BRIGHTNESS_ICON='f7ec'
else
	BRIGHTNESS_ICON='f7ec'
fi

echo "$BRIGHTNESS_ICON $BRIGHTNESS_VALUE"

