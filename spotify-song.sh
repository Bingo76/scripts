#!/bin/bash

# Fetch the playback status
status=$(playerctl -p spotify status 2>/dev/null)

# Define the invisible character (zero-width space)
invisible_char=$'\u200B'

# Define play and pause icons
play_icon=" "
pause_icon=" "

# Fetch the current song metadata
song=$(playerctl -p spotify metadata --format "{{ artist }} - {{ title }}" 2>/dev/null)

# Remove leading and trailing whitespace
song=$(printf "%s" "$song" | xargs)

# Check for specific unwanted outputs
if [ -z "$song" ] || [ "$song" = "n/a" ]; then
  song="$invisible_char"
fi

# Determine the icon based on playback status
if [ "$status" = "Playing" ]; then
  song="$play_icon $song  • "
elif [ "$status" = "Paused" ]; then
  song="$pause_icon $song  • "
fi

printf "%s" "$song"

