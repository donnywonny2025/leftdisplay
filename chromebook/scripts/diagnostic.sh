#!/bin/bash
echo ""
echo "=== CHROMEBOOK CPU & SYSTEM INFO ==="
echo ""

echo ">> CPU Model:"
cat /proc/cpuinfo | grep "model name" | head -1

echo ""
echo ">> CPU Flags (instruction sets):"
cat /proc/cpuinfo | grep "flags" | head -1 | tr ' ' '\n' | grep -E "avx|sse|lm" | sort | tr '\n' ' '
echo ""

echo ""
echo ">> Architecture:"
uname -m

echo ""
echo ">> OS Info:"
cat /etc/os-release | head -4

echo ""
echo ">> Checking ~/.local/bin/:"
ls -la ~/.local/bin/ 2>/dev/null || echo "   (empty or doesn't exist)"

echo ""
echo ">> Searching for 'agy' anywhere..."
find /home -name "agy*" -type f 2>/dev/null
find /usr -name "agy*" -type f 2>/dev/null
find /opt -name "agy*" -type f 2>/dev/null

echo ""
echo ">> Checking file type of agy binary:"
file ~/.local/bin/agy 2>/dev/null || echo "   (not found)"

echo ""
echo "=== END REPORT ==="
