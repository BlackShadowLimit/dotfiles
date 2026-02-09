#!/bin/sh
if [ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
    export HYPRLAND_INSTANCE_SIGNATURE=$(ls -t $XDG_RUNTIME_DIR/hypr 2>/dev/null | head -n 1)
fi

CURRENT_WS=$(hyprctl activeworkspace -j | jq '.id')

if [ "$CURRENT_WS" -le 1 ]; then
    exit 0
fi

hyprctl dispatch workspace $((CURRENT_WS - 1))
