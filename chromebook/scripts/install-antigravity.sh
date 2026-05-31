#!/bin/bash
# ============================================
#  Google Antigravity — Chromebook Installer
#  Just run: bash install-antigravity.sh
# ============================================

set -e

echo ""
echo "  ╔══════════════════════════════════════╗"
echo "  ║  Google Antigravity — Installing...  ║"
echo "  ╚══════════════════════════════════════╝"
echo ""

# Update system packages
echo ">> Updating system packages..."
sudo apt-get update -qq

# Install dependencies
echo ">> Installing dependencies..."
sudo apt-get install -y -qq curl libnss3 libxss1 libasound2 libatk-bridge2.0-0 libgtk-3-0 libgbm-dev > /dev/null 2>&1

# Install Antigravity CLI
echo ">> Downloading Antigravity CLI..."
curl -fsSL https://antigravity.google/cli/install.sh | bash

# Ensure PATH is set
export PATH="$HOME/.local/bin:$PATH"
if ! grep -q '.local/bin' ~/.bashrc 2>/dev/null; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
fi

# Fix browser sign-in for ChromeOS
echo ">> Configuring browser integration..."
xdg-settings set default-web-browser garcon_host_browser.desktop 2>/dev/null || true

echo ""
echo "  ╔══════════════════════════════════════╗"
echo "  ║           INSTALL COMPLETE!          ║"
echo "  ║                                      ║"
echo "  ║   Type 'agy' to start Antigravity   ║"
echo "  ║                                      ║"
echo "  ╚══════════════════════════════════════╝"
echo ""
