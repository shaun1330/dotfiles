#!/bin/bash


for s in $(sketchybar --query bar | jq '.items' | grep space | sed 's/[",]//g'); do
	i=$(echo "$s" | awk -F '.' '{print $2}')
	if [[ -z $i ]]; then
		continue
	fi

	window_apps=$(aerospace list-windows --workspace $i | awk -F "|" '{print $2}')
	icon_string=""
	if [[ -z "$window_apps" ]]; then
		sketchybar --set $s icon="-"
		continue
	fi

	while IFS= read -r app; do
		app=$(echo "$app" | xargs)
		icon_string+=$($CONFIG_DIR/plugins/icon_map_fn.sh "$app")
	done <<<"$window_apps"

	sketchybar --set $s icon="$icon_string"
done
