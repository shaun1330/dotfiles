#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh
if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME background.color=$WHITE \
    label.color=$BAR_COLOR \
    icon.color=$BAR_COLOR 
else
  sketchybar --set $NAME background.color=$ITEM_BG_COLOR \
    label.color=$WHITE \
    icon.color=$WHITE
fi




