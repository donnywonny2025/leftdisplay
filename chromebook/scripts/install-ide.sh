#!/bin/bash
# ============================================
#  Install Antigravity IDE (not CLI)
#  The full VS Code-based editor
# ============================================

set -e

echo ""
echo "  ╔══════════════════════════════════════╗"
echo "  ║  Installing Antigravity IDE...       ║"
echo "  ╚══════════════════════════════════════╝"
echo ""

# Find the tar.gz wherever it landed
TARBALL=$(find /home /mnt/chromeos 2>/dev/null -name "antigravity*linux*x64*.tar.gz" -o -name "Antigravity*linux*x64*.tar.gz" 2>/dev/null | head -1)

if [ -z "$TARBALL" ]; then
    echo ">> Can't find the tar.gz. Downloading fresh copy..."
    cd ~
    wget -q --show-progress "https://antigravity.google/download/linux-x64" -O antigravity-linux-x64.tar.gz
    TARBALL=~/antigravity-linux-x64.tar.gz
fi

echo ">> Found: $TARBALL"
echo ">> Extracting..."
cd ~
tar -xzf "$TARBALL"

# Find what got extracted
EXTRACTED=$(ls -d ~/antigravity* ~/Antigravity* 2>/dev/null | grep -v ".tar.gz" | head -1)

if [ -z "$EXTRACTED" ]; then
    EXTRACTED=$(ls -td ~/*/ 2>/dev/null | head -1)
fi

echo ">> Extracted to: $EXTRACTED"
echo ">> Contents:"
ls "$EXTRACTED" 2>/dev/null | head -10

# Try to find and run the binary
BINARY=$(find "$EXTRACTED" -name "antigravity" -type f -perm +111 2>/dev/null | head -1)
if [ -z "$BINARY" ]; then
    BINARY=$(find "$EXTRACTED" -name "antigravity" -type f 2>/dev/null | head -1)
    if [ -n "$BINARY" ]; then
        chmod +x "$BINARY"
    fi
fi

if [ -n "$BINARY" ]; then
    echo ""
    echo "  ╔══════════════════════════════════════╗"
    echo "  ║  Found binary: $BINARY"
    echo "  ║  Launching now...                    ║"
    echo "  ╚══════════════════════════════════════╝"
    "$BINARY" &
else
    echo ""
    echo ">> Could not find the antigravity binary."
    echo ">> Here's everything that was extracted:"
    find "$EXTRACTED" -type f | head -20
fi
