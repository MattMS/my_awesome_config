#!/bin/sh

Xephyr -ac -br -noreset -screen 800x480 :1 &
XEPHYR_PID=$!
sleep 1
DISPLAY=:1.0 awesome -c dev_rc.lua
kill $XEPHYR_PID
