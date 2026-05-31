#!/bin/bash
# ============================================
#  Connect Chromebook to Mac (two-way)
#  Sets up reverse tunnel so Mac can reach back
# ============================================

echo ""
echo "  ╔══════════════════════════════════════╗"
echo "  ║  Setting up two-way connection...    ║"
echo "  ╚══════════════════════════════════════╝"
echo ""

# Step 1: Install SSH server on Chromebook
echo ">> Installing SSH server on this Chromebook..."
sudo apt-get update -qq
sudo apt-get install -y -qq openssh-server

# Step 2: Configure and start SSH
echo ">> Starting SSH server..."
sudo sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo service ssh start 2>/dev/null || sudo /etc/init.d/ssh start 2>/dev/null

# Step 3: Set a password if needed
echo ""
echo ">> Set a password for your Linux user (you'll need this):"
passwd

echo ""
echo ">> Chromebook SSH server running on port 2222"
echo ""
echo ">> Now connecting to Mac with reverse tunnel..."
echo ">> Enter your MAC password when prompted."
echo ""

# Step 4: Connect with reverse tunnel
# Mac can then reach Chromebook at localhost:9922
ssh -R 9922:localhost:2222 jeffkerr@192.168.1.138

