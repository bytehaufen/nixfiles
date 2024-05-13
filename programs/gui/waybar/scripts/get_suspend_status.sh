#!/bin/sh

if pgrep swayidle >/dev/null 2>&1; then
	echo 󰒲
else
	echo 󰒳
fi
