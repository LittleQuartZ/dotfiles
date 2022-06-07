#!/bin/sh
case "$1" in
  period-changed)
    notify-send "Redshift" "Period changed to $3"
    case "$3" in
      night)
        light -S 30
        ;;
      transition)
        light -S 40
        ;;
      day)
        light -S 50
        ;;
    esac
    ;;
esac
