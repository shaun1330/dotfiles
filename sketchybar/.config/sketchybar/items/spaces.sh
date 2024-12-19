#!/bin/bash

sketchybar --add event aerospace_workspace_change
for mid in $(aerospace list-monitors | awk '{print $1}'); do
  for sid in $(aerospace list-workspaces --monitor $mid | grep -oe "^[1-9,T]$"); do
    echo $sid $mid
    sketchybar --add item space.$sid left \
      --subscribe space.$sid aerospace_workspace_change \
      --set space.$sid \
      display=$mid \
      label.padding_right=20 \
      label.y_offset=-1 \
      background.color=$ITEM_BG_COLOR \
      icon.font="sketchybar-app-font:Regular:16.0" \
      label="$sid" \
      click_script="aerospace workspace $sid" \
      script="$CONFIG_DIR/plugins/aerospace.sh $sid"
  done
done

#display=$((mid == 1 ? mid + 2 : mid - 1)) \
sketchybar --add item space_separator left \
  --set space_separator \
  icon.color=$WHITE \
  icon.padding_left=4 \
  label.drawing=off \
  background.drawing=off \
  script="$PLUGIN_DIR/space_windows.sh" \
  --subscribe space_separator aerospace_workspace_change 
