#!/usr/bin/env bash

export XDG_RUNTIME_DIR="/run/user/1000"

# Terminate already running bar instances
# killall -q polybar
polybar-msg cmd quit

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar

for m in $(polybar --list-monitors | cut -d":" -f1); do
  export MONITOR=$m
  export TRAY_POSITION=none
  if [[ $m == "eDP" ]]; then
    export TRAY_POSITION=right
  elif [[ $m = "HDMI-A-0" ]]; then
    export TRAY_POSITION=right
  fi
  polybar "$1" -c ~/.config/polybar/config.ini 2>&1 | tee -a "/tmp/polybar_$1.log" &
  disown
done
