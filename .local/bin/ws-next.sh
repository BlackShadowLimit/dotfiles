#!/bin/sh
if [ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
    export HYPRLAND_INSTANCE_SIGNATURE=$(ls -t $XDG_RUNTIME_DIR/hypr 2>/dev/null | head -n 1)
fi

CURRENT_WS=$(hyprctl activeworkspace -j | jq '.id')
LIMIT=10

# 如果已經到 10，原地煞車
if [ "$CURRENT_WS" -ge "$LIMIT" ]; then
    exit 0
fi

# 強制跳往目前編號 + 1
hyprctl dispatch workspace $((CURRENT_WS + 1))
