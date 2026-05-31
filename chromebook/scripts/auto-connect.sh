#!/bin/bash
# ============================================
#  Auto-Connect to Mac — No Password Needed
#  Run once, connects forever
# ============================================

echo ">> Setting up automatic connection..."

# Install the key
mkdir -p ~/.ssh
cat > ~/.ssh/mac_key << 'KEYEOF'
-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
QyNTUxOQAAACDldBnoSVYwIGi4Kk2IjssyfpGI5+yv/TKdKISVuxu7DQAAAJjdtB4N3bQe
DQAAAAtzc2gtZWQyNTUxOQAAACDldBnoSVYwIGi4Kk2IjssyfpGI5+yv/TKdKISVuxu7DQ
AAAEBtGSU3AkRr7lfr2X/HMgxG0jXZ+/K9pUbTaWECCbfS/uV0GehJVjAgaLgqTYiOyzJ+
kYjn7K/9Mp0ohJW7G7sNAAAAEWNocm9tZWJvb2stYWNjZXNzAQIDBA==
-----END OPENSSH PRIVATE KEY-----
KEYEOF
chmod 600 ~/.ssh/mac_key

# Create a simple connect command
cat > ~/connect-mac << 'SCRIPTEOF'
#!/bin/bash
ssh -i ~/.ssh/mac_key -o StrictHostKeyChecking=no -R 9922:localhost:22 jeffkerr@192.168.1.138
SCRIPTEOF
chmod +x ~/connect-mac

echo ""
echo "  ╔══════════════════════════════════════╗"
echo "  ║  DONE! Connecting to Mac now...      ║"
echo "  ║                                      ║"
echo "  ║  Next time just type: ~/connect-mac  ║"
echo "  ╚══════════════════════════════════════╝"
echo ""

# Connect now
ssh -i ~/.ssh/mac_key -o StrictHostKeyChecking=no -R 9922:localhost:22 jeffkerr@192.168.1.138
