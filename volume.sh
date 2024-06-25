#!/bin/bash

# Fetch the current volume level
volume=$(pamixer --get-volume 2>/dev/null)

# Check if the volume command succeeded
if [ $? -eq 0 ]; then
  # Print the volume level for the status bar
  printf "Vol: %s%%" "$volume"
else
  printf "Vol: Error"
fi

