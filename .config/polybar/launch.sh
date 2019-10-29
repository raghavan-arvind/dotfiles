#!/bin/bash

# Terminate existing polybar instances
killall -q polybar

# Wait for processes to shut down
while pgrep -x polybar > /dev/null; do sleep 1; done

# Launch polybar
polybar arvind-bar &
