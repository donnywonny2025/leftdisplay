#!/bin/bash
# Fix the SSH server and reconnect with tunnel
echo ">> Fixing SSH server..."
sudo service ssh stop 2>/dev/null
sudo sed -i 's/Port 2222/Port 22/' /etc/ssh/sshd_config 2>/dev/null
sudo sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config 2>/dev/null
sudo sed -i 's/.*PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config 2>/dev/null
sudo sed -i 's/.*PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config 2>/dev/null
sudo /etc/init.d/ssh start 2>/dev/null || sudo service ssh start 2>/dev/null

echo ">> SSH server running on port 22"
echo ">> Testing..."
nc -z localhost 22 && echo ">> SSH OK!" || echo ">> SSH FAILED"

echo ""
echo ">> Now connecting to Mac with tunnel..."
echo ">> USE YOUR MAC PASSWORD (not 7676)"
echo ""
ssh -R 9922:localhost:22 jeffkerr@192.168.1.138
