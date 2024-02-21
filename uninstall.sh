#!/bin/bash

# Unique tag for identifying lines added by the installation script
UNIQUE_TAG="# RSAATT-18F7JMCE94"

# Function to remove lines by a unique tag
remove_lines_by_tag() {
    local tag="$1"
    local file="$2"
    sed -i "/$tag/d" "$file"
}

# Files to clean
remove_lines_by_tag "$UNIQUE_TAG" "$HOME/.bashrc"
remove_lines_by_tag "$UNIQUE_TAG" "$HOME/.zshrc"
remove_lines_by_tag "$UNIQUE_TAG" "$HOME/.ssh/config"

echo "Uninstall completed. Please restart your terminal."
