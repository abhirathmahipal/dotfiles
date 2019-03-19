#!/bin/bash
for output in $(xrandr | grep '\Wconnected' | awk '{ print $1 }'); do
    if [[ $output =~ ^eDP.*$ ]]; then
            edp=$output
    fi
done
for output in $(xrandr | grep '\Wconnected' | awk '{ print $1 }'); do
    if [[ ! $output =~ ^eDP.*$ ]]; then
       xrandr --output $edp --auto --output $output --pos 0x0 --auto \
              --left-of $edp --primary
    fi
done
