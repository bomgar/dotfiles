#!/bin/bash

SCREENSHOT=/tmp/screen_locked.png
SCREENSHOT_BLURED=/tmp/screen_locked_blur.png

# Take a screenshot
grim $SCREENSHOT

# blur it
magick $SCREENSHOT -blur 0x4 $SCREENSHOT_BLURED
rm $SCREENSHOT

# Lock screen displaying this image.
swaylock -f -t -i $SCREENSHOT_BLURED

