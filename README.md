# Space Command Deck

A compact space-themed [Starship](https://starship.rs/) prompt preset with deep-space colors, clean powerline blocks, Git-aware pathing, and a ringed planet centerpiece.

Space Command Deck is designed for developers who want a sci-fi terminal prompt that looks polished without taking over the whole terminal.

![Space Command Deck preview](screenshots/preview.png)

## Preview

```text
   rpx/api   main ✦2 ?1  🪐  22.0.0 󰏗 1.0.0       orbit 21:42
❯
```

## Features

* Compact space / mission-control inspired prompt
* Custom `celestial_void` color palette
* Strong blue → navy → indigo → violet block gradient
* Dedicated OS block with distro icons
* Ringed planet centerpiece: `🪐`
* Smart Git-aware directory display
* Short path output to prevent wrapping
* Fish-style path shortening support
* Git branch and Git status indicators
* Node.js, Python, and package version modules
* Command duration shown as `burn`
* Clock shown as `orbit`
* Vim mode-aware prompt character
* Minimal default module set for clean daily use
* Nerd Font-friendly symbols
* Designed for Ghostty, Kitty, Alacritty, WezTerm, GNOME Console, and other modern terminals

## Requirements

* [Starship](https://starship.rs/)
* A Nerd Font, such as:

  * FiraCode Nerd Font
  * JetBrainsMono Nerd Font
  * CaskaydiaCove Nerd Font
* A terminal with truecolor support
* A dark terminal theme is recommended

## Recommended Terminal Setup

This preset works best with a dark terminal theme and a Nerd Font.

For Ghostty, add something like this to `~/.config/ghostty/config`:

```ini
font-family = FiraCode Nerd Font
font-size = 12
background-opacity = 0.90
window-padding-x = 14
window-padding-y = 12
cursor-style = block
cursor-style-blink = true
```

Recommended dark themes:

* Tokyo Night
* Catppuccin Mocha
* Kanagawa
* Gruvbox Dark
* Nord

## Installation

### Option 1: Manual Install

Clone this repository:

```bash
git clone https://github.com/YOUR_USERNAME/space-command-deck.git
cd space-command-deck
```

Back up your existing Starship config:

```bash
cp ~/.config/starship.toml ~/.config/starship.toml.backup
```

Install the preset:

```bash
mkdir -p ~/.config
cp starship.toml ~/.config/starship.toml
```

Reload your shell:

```bash
exec $SHELL
```

### Option 2: One-Line Install

```bash
mkdir -p ~/.config && \
cp ~/.config/starship.toml ~/.config/starship.toml.backup 2>/dev/null || true && \
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/space-command-deck/main/starship.toml -o ~/.config/starship.toml && \
exec $SHELL
```

Replace `YOUR_USERNAME` with your GitHub username.

## What the Prompt Shows

The compact prompt focuses on the modules that matter most for daily development:

| Section         | Meaning                                     |
| --------------- | ------------------------------------------- |
| OS block        | Your operating system or Linux distro       |
| Directory block | Current folder, shortened to avoid wrapping |
| Git block       | Current Git branch and working tree status  |
| `🪐`            | Ringed planet centerpiece                   |
| Node.js         | Node version when inside a Node project     |
| Python          | Python version when inside a Python project |
| Package         | Package version from project metadata       |
| `burn`          | How long the last command took              |
| `orbit`         | Current time                                |

## Git Status Symbols

| Symbol | Meaning         |
| ------ | --------------- |
| `?`    | Untracked files |
| `✦`    | Modified files  |
| `+`    | Staged changes  |
| `📦`   | Stashed changes |
| `⇡`    | Commits ahead   |
| `⇣`    | Commits behind  |
| `✘`    | Deleted files   |
| `⚔`    | Merge conflicts |

## Path Behavior

Space Command Deck keeps paths short on purpose.

Inside a Git repository, the prompt is repo-aware:

```text
~/code/rpx              → rpx
~/code/rpx/api          → api
~/code/rpx/api/src      → api/src
~/code/rpx/api/src/lib  → src/lib
```

This is controlled by:

```toml
[directory]
truncation_length = 2
truncate_to_repo = true
```

If you use fish-style path shortening, you may also see compact paths like:

```text
//rpx/api
```

Increase `truncation_length` if you want to see more folders.

Decrease it if you want an even shorter prompt.

## Customization

### Show more path folders

```toml
[directory]
truncation_length = 3
```

### Make command duration show sooner

```toml
[cmd_duration]
min_time = 1000
```

### Make command duration show less often

```toml
[cmd_duration]
min_time = 3000
```

### Disable the clock

```toml
[time]
disabled = true
```

### Disable Python

```toml
[python]
disabled = true
```

### Disable Node.js

```toml
[nodejs]
disabled = true
```

## Troubleshooting

### Icons look like boxes

Install and use a Nerd Font.

For Ghostty, make sure your config uses the exact font family name:

```ini
font-family = FiraCode Nerd Font
```

Then fully close and reopen your terminal.

You can test icons with:

```bash
echo "      󰏗   "
```

If one of those icons renders as a box or a weird symbol, your terminal is not using the right Nerd Font or that glyph is unsupported by your font.

### Prompt is still too long

Try reducing the directory length:

```toml
[directory]
truncation_length = 1
```

You can also disable language modules you do not use:

```toml
[python]
disabled = true

[nodejs]
disabled = true

[package]
disabled = true
```

### The prompt does not update

Reload your shell:

```bash
exec $SHELL
```

Or fully close and reopen your terminal.

## Repository Structure

```text
space-command-deck/
├── README.md
├── starship.toml
├── install.sh
├── LICENSE
└── screenshots/
    └── preview.png
```

## Install Script

Create an `install.sh` file:

```bash
#!/usr/bin/env bash

set -e

mkdir -p "$HOME/.config"

if [ -f "$HOME/.config/starship.toml" ]; then
  cp "$HOME/.config/starship.toml" "$HOME/.config/starship.toml.backup"
  echo "Backed up existing config to ~/.config/starship.toml.backup"
fi

cp starship.toml "$HOME/.config/starship.toml"

echo "Installed Space Command Deck."
echo "Run: exec \$SHELL"
```

Make it executable:

```bash
chmod +x install.sh
```

Then users can install with:

```bash
./install.sh
```

## Uploading to GitHub

Create the project folder:

```bash
mkdir space-command-deck
cd space-command-deck
```

Create the files:

```bash
nano starship.toml
nano README.md
nano install.sh
```

Make the install script executable:

```bash
chmod +x install.sh
```

Initialize Git:

```bash
git init
git add .
git commit -m "Initial Space Command Deck preset"
```

Create a new empty GitHub repo named:

```text
space-command-deck
```

Then connect and push:

```bash
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/space-command-deck.git
git push -u origin main
```

After pushing, the raw download link will be:

```text
https://raw.githubusercontent.com/YOUR_USERNAME/space-command-deck/main/starship.toml
```

Use that link in the one-line installer.

## License

MIT License
