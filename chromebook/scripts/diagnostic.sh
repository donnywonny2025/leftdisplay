#!/bin/bash
# Diagnostic - find what got installed and where
echo ""
echo "=== DIAGNOSTIC REPORT ==="
echo ""

echo ">> Checking ~/.local/bin/"
ls -la ~/.local/bin/ 2>/dev/null || echo "   (empty or doesn't exist)"

echo ""
echo ">> Searching for 'agy' anywhere..."
find / -name "agy*" -type f 2>/dev/null | head -20

echo ""
echo ">> Searching for 'antigravity' anywhere..."
find / -name "antigravity*" -type f 2>/dev/null | head -20

echo ""
echo ">> Current PATH:"
echo "$PATH"

echo ""
echo ">> What curl downloaded:"
ls -la /tmp/agy* 2>/dev/null || echo "   (nothing in /tmp)"

echo ""
echo "=== END REPORT ==="
echo "Copy everything above and tell your Mac what you see."
