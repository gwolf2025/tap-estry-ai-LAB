#!/usr/bin/env bash
set -euo pipefail

echo "Setting up Goose Codespace workspace..."

sudo apt-get update -y
sudo apt-get install -y curl git jq bzip2 unzip build-essential

# Make sure local bin is on PATH
if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$HOME/.bashrc"; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
fi

export PATH="$HOME/.local/bin:$PATH"

# Install Goose CLI if missing
if ! command -v goose >/dev/null 2>&1; then
  echo "Installing Goose CLI..."
  curl -fsSL https://github.com/aaif-goose/goose/releases/download/stable/download_cli.sh | CONFIGURE=false bash
else
  echo "Goose already installed."
fi

# Optional: install common JS/Python helpers
if command -v npm >/dev/null 2>&1; then
  npm install -g pnpm
fi

python3 -m pip install --upgrade pip

echo ""
echo "Setup complete."
echo "Open a new terminal or run: source ~/.bashrc"
echo "Then configure Goose with: goose configure"
