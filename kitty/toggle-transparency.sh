#!/bin/bash

# Check for transparency settings in the kitty theme file
KITTY_CONF=~/.config/kitty/current-theme.conf

if grep -q 'background_opacity 0.9' "$KITTY_CONF"; then
    # If background_opacity is 0.9, change to 1.0 (solid background)
    sed -i '' 's/background_opacity 0.9/background_opacity 1.0/g' "$KITTY_CONF"
    echo "Transparency disabled. Reload kitty to see changes."

elif grep -q 'background_opacity 1.0' "$KITTY_CONF"; then
    # If background_opacity is 1.0, change to 0.9 (transparent background)
    sed -i '' 's/background_opacity 1.0/background_opacity 0.9/g' "$KITTY_CONF"
    echo "Transparency enabled. Reload kitty to see changes."

else
    # No transparency settings found
    echo "There are no transparency settings in the current theme. Do you want to add them? (y/n)"
    read -r answer

    if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
        echo "What do you want: blurry or solid background? (b/s)"
        read -r ans

        if [[ "$ans" == "b" || "$ans" == "B" ]]; then
            # Add transparency with blur
            echo "background_opacity 0.9" >> "$KITTY_CONF"
            echo "background_blur 32" >> "$KITTY_CONF"
            echo "Transparency (blurred) enabled. Reload kitty to see changes."

        elif [[ "$ans" == "s" || "$ans" == "S" ]]; then
            # Add solid background setting
            echo "background_opacity 1.0" >> "$KITTY_CONF"
            echo "Solid background enabled. Reload kitty to see changes."

        else
            echo "Invalid choice. No changes made."
        fi
    else
        echo "No changes made."
    fi
fi
