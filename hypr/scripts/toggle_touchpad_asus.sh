#!/bin/bash

#!/usr/bin/env bash
set -euo pipefail

DEV="ascp1201:00-093a:3017-touchpad"     # ← your device name
STATE="${XDG_RUNTIME_DIR:-/tmp}/hypr-touchpad.disabled"

if [[ -e "$STATE" ]]; then
    hyprctl eval "hl.device({ name = '$DEV', enabled = true })"  >/dev/null
    rm -f "$STATE"
    msg="Touchpad enabled"
else
    hyprctl eval "hl.device({ name = '$DEV', enabled = false })" >/dev/null
    touch "$STATE"
    msg="Touchpad disabled"
fi

command -v notify-send >/dev/null && notify-send -t 1500 "$msg" || true
