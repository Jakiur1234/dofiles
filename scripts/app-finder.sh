#!/bin/bash

# Get all applications from the /Applications directory
apps=$(find /Applications -iname "*.app" -type d)

# If an app name is provided as an argument, search for it
if [ -n "$1" ]; then
    # Search for the exact match of the app name (case insensitive)
    selected_app=$(echo "$apps" | sed 's|/Applications/||' | grep -i "$1" | fzf)

    # If an app is found, open it
    if [ -n "$selected_app" ]; then
        open "/Applications/$selected_app.app"
    else
        echo "Application '$1' not found."
    fi
else
    # If no input is provided, show the fuzzy finder
    selected_app=$(echo "$apps" | sed 's|/Applications/||' | fzf)

    # If an app was selected, open it
    if [ -n "$selected_app" ]; then
        open "/Applications/$selected_app"
    else
        echo "No application selected."
    fi
fi
