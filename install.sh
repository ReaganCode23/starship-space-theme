#!/usr/bin/env bash

set -e

mkdir -p "$HOME/.config"

if [ -f "$HOME/.config/starship.toml" ]; then
  cp "$HOME/.config/starship.toml" "$HOME/.config/starship.toml.backup"
  echo "Backed up existing config to ~/.config/starship.toml.backup"
fi

cp starship.toml "$HOME/.config/starship.toml"

echo "Installed Space Command Deck"
echo "Run: exec \$SHELL"
