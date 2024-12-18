#!/bin/bash

# Check if brew and fzf are installed
if ! command -v brew &> /dev/null; then
  echo "Homebrew is not installed. Please install Homebrew first."
  exit 1
fi

if ! command -v fzf &> /dev/null; then
  echo "fzf is not installed. Please install fzf first."
  exit 1
fi

# Fetch the list of all formulae and casks
echo "Fetching Homebrew package list..."
packages=$(brew formulae; brew casks)

# Use fzf to search and select a package
selected_package=$(echo "$packages" | fzf --height=100% --layout=reverse --prompt="Search Brew Packages: ")

# Check if a package was selected
if [[ -n "$selected_package" ]]; then
  # Check if the package is already installed
  if brew list --formula | grep -q "^$selected_package\$" || brew list --cask | grep -q "^$selected_package\$"; then
    echo "Package '$selected_package' is already installed."
  else
    # Install the selected package
    echo "Installing package: $selected_package"
    if brew formulae | grep -q "^$selected_package\$"; then
      brew install "$selected_package"
    elif brew casks | grep -q "^$selected_package\$"; then
      brew install --cask "$selected_package"
    fi
  fi
else
  echo "No package selected."
fi
