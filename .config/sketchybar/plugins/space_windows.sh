#!/bin/bash

if [ "$SENDER" = "aerospace_workspace_change" ]; then
  apps="$(aerospace list-windows --workspace $FOCUSED_WORKSPACE --format %{app-name})"

  icon_strip=" "
  if [ "${apps}" != "" ]; then
    while read -r app
    do
      icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
    done <<< "${apps}"
  else
    icon_strip=" —"
  fi

  sketchybar --set space.$FOCUSED_WORKSPACE label="$icon_strip"
fi
