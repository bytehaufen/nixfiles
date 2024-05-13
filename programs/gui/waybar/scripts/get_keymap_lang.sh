#!/bin/bash

KEYMAP=$(hyprctl devices | rg -A 2 'at-translated-set-2-keyboard' | grep keymap | awk '{ print $3 }')

echo "$KEYMAP"
