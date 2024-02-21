#!/bin/bash

# Dynamically set the path to the directory containing this script
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

# Define target directories
SSH_DIR="$HOME/.ssh"
ALIASES_DIR="$HOME"

# Unique tag for identifying lines added by this script
UNIQUE_TAG="# RSAATT-18F7JMCE94"

# Ensure the SSH directory exists
mkdir -p "$SSH_DIR"

# Prepend SSH config Include command if it's not already included
SSH_CONFIG_INCLUDE="Include $REPO_DIR/ssh/config $UNIQUE_TAG"
SSH_CONFIG_FILE="$SSH_DIR/config"
if ! grep -q "${SSH_CONFIG_INCLUDE% $UNIQUE_TAG}" "$SSH_CONFIG_FILE" 2>/dev/null; then
    if [ ! -f "$SSH_CONFIG_FILE" ]; then
        echo "$SSH_CONFIG_INCLUDE" > "$SSH_CONFIG_FILE"
    else
        echo -e "$SSH_CONFIG_INCLUDE\n$(cat "$SSH_CONFIG_FILE")" > "$SSH_CONFIG_FILE"
    fi
fi

# Function to safely append content if not already present in a file, with unique tag
append_if_not_exists() {
    local content="$1"
    local file="$2"
    local tagged_content="$content $UNIQUE_TAG"
    grep -qxF "${content}" "$file" 2>/dev/null || echo "$tagged_content" >> "$file"
}

# Append sourcing of bash_aliases and zsh_aliases directly in .bashrc and .zshrc, with unique tag
BASH_ALIASES_SOURCE="if [ -f \"${REPO_DIR}/aliases/bash_aliases\" ]; then . \"${REPO_DIR}/aliases/bash_aliases\"; fi"
ZSH_ALIASES_SOURCE="if [ -f \"${REPO_DIR}/aliases/zsh_aliases\" ]; then . \"${REPO_DIR}/aliases/zsh_aliases\"; fi"
append_if_not_exists "$BASH_ALIASES_SOURCE" "$HOME/.bashrc"
append_if_not_exists "$ZSH_ALIASES_SOURCE" "$HOME/.zshrc"

# Update PATH to include the scripts directory, if not already included, with unique tag
PATH_UPDATE="export PATH=\"\$PATH:$REPO_DIR/scripts\""
BASH_PROFILE_UPDATE="if [ -d \"$REPO_DIR/scripts\" ] && [[ \":\$PATH:\" != *\":$REPO_DIR/scripts:\"* ]]; then $PATH_UPDATE; fi"
append_if_not_exists "$BASH_PROFILE_UPDATE" "$HOME/.bashrc"
append_if_not_exists "$BASH_PROFILE_UPDATE" "$HOME/.zshrc"

# Dynamically link sshrc_aliases for use with sshrc, with unique tag
SSHRC_ALIASES_SOURCE="if [ -f \"${REPO_DIR}/aliases/sshrc_aliases\" ]; then . \"${REPO_DIR}/aliases/sshrc_aliases\"; fi"
SSHRC_FILE="$HOME/.sshrc"
append_if_not_exists "$SSHRC_ALIASES_SOURCE" "$SSHRC_FILE"

echo "Setup completed. Please restart your terminal."
