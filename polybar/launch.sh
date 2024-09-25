#!/usr/bin/env sh

killall -q polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

desktop=$(echo $DESKTOP_SESSION)
count=$(xrandr --query | grep " connected" | cut -d" " -f1 | wc -l)


case $desktop in

    i3|/usr/share/xsessions/i3)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload bottom-i3 -c ~/.config/polybar/config.ini &
      done
    else

    polybar --reload bottom-i3 -c ~/.config/polybar/config.ini &
    fi
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload top-i3 -c ~/.config/polybar/config.ini &
      done
    else

    polybar --reload top-i3-extra -c ~/.config/polybar/config.ini &
    polybar --reload bottom-i3-extra -c ~/.config/polybar/config.ini &
    fi
    ;;








    fvwm3|/usr/share/xsessions/fvwm3)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload bottom-fvwm3 -c ~/.config/polybar/config.ini &
      done
    else
    polybar --reload bottom-fvwm3 -c ~/.config/polybar/config.ini &
    fi

     # second polybar at bottom
     # if type "xrandr" > /dev/null; then
     #  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
     #    MONITOR=$m polybar --reload bottom-fvwm3-extra -c ~/.config/polybar/config.ini &
     #  done
     # else
     # polybar --reload bottom-fvwm3-extra -c ~/.config/polybar/config.ini &
     # fi

    ;;

    wmderland|/usr/share/xsessions/wmderland)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload bottom-wmderland -c ~/.config/polybar/config.ini &
      done
    else
    polybar --reload bottom-wmderland -c ~/.config/polybar/config.ini &
    fi
    # second polybar at bottom
    # if type "xrandr" > /dev/null; then
    #   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    #     MONITOR=$m polybar --reload bottom-wmderland-extra -c ~/.config/polybar/config.ini &
    #   done
    # else
    # polybar --reload bottom-wmderland-extra -c ~/.config/polybar/config.ini &
    # fi
    ;;

    leftwm|/usr/share/xsessions/leftwm)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload bottom-leftwm -c ~/.config/polybar/config.ini &
      done
    else
    polybar --reload bottom-leftwm -c ~/.config/polybar/config.ini &
    fi
    # second polybar at bottom
    # if type "xrandr" > /dev/null; then
    #   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    #     MONITOR=$m polybar --reload bottom-leftwm-extra -c ~/.config/polybar/config.ini &
    #   done
    # else
    # polybar --reload bottom-leftwm-extra -c ~/.config/polybar/config.ini &
    # fi
    ;;

esac