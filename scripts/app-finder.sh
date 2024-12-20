#!/bin/bash

# Gather applications from common directories
apps=$(find /Applications /System/Applications ~/Applications -iname "*.app" -type d 2>/dev/null)

# If an app name is provided as an argument, search for it
if [ -n "$1" ]; then
    # Search for the exact match of the app name (case insensitive)
    selected_app=$(echo "$apps" | sed 's|.*/||' | sed 's|\.app$||' | grep -i "$1" | fzf --prompt="Select App(s) to Open: " --multi)

    # If apps are found, open them
    if [ -n "$selected_app" ]; then
        app_path=$(echo "$apps" | grep "/${selected_app}.app$" | head -n 1)
        open "$app_path"
        echo "Opening $selected_app..."
    else
        echo "Application '$1' not found."
    fi
else
    # If no input is provided, show the fuzzy finder
    selected_app=$(echo "$apps" | sed 's|.*/||' | sed 's|\.app$||' | fzf --prompt="Select App(s) to Open: " --multi)

    # If apps were selected, open them
    if [ -n "$selected_app" ]; then
        echo "$selected_app"
        IFS=$'\n'
        for app in $selected_app; do
            app_path=$(echo "$apps" | grep "/${app}.app$" | head -n 1)
            open "$app_path"
            echo "Opening $app_path..."
        done
    else
        echo "No application selected."
    fi
fi
