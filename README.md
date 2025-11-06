# Bash Script Collection

This directory currently contains a growing list of Bash scripts. Each script is self-contained and focuses on terminal-driven visualizations or utilities.

## Script Index

1. `vibe_full.sh` – Launches a full-screen animated "V I B E" scene. The script scatters colorful emoji, kana, and hangul characters across the terminal background, carves out a central frame, and animates alternating letterforms for “V I B E” above a steady “coding” caption. It hides the cursor, keeps the frame clear of background glyphs, and loops until interrupted (`Ctrl+C`), restoring the terminal state on exit.

## Usage

Make the script executable (`chmod +x scriptname.sh`) and run it from this directory:

```bash
./vibe_full.sh
```

✅ **Works perfectly on:**

| Platform | Tested Shell | Notes |
| :--- | :--- | :--- |
| Linux (Ubuntu, Mint, Debian, Arch, etc.) | bash, zsh | Full-color ANSI supported in all modern terminals. |
| macOS | Terminal / iTerm2 | Works great, full emoji & color rendering. |
| Windows 10/11 | WSL (Windows Subsystem for Linux), Git Bash, or Windows Terminal | WSL2 gives perfect output. CMD alone does not support all ANSI sequences or emojis. |
| Android | Termux app | 100 % compatible, emojis and color output fine. |
| iOS | Blink Shell, Termius | Works if you install a Bash shell environment. |
| Raspberry Pi | Native Linux terminal | Runs beautifully — lightweight, zero dependencies. |
⚙️ Runtime Requirements

Bash ≥ 4.0

UTF-8 terminal font that supports emojis and CJK symbols

Colors ≥ 8-bit ANSI (all modern terminals)

No packages, no root privileges, no libraries — just run:

## Copyright

Copyright © Zik Uralov 2025 All rights reserved.