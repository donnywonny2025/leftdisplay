#!/bin/bash
# ============================================
#  SSH to Mac — run Antigravity remotely
#  Your Chromebook becomes a thin client
# ============================================

MAC_IP="192.168.1.138"
MAC_USER="jeffkerr"

echo ""
echo "  ╔══════════════════════════════════════╗"
echo "  ║  Connecting to Mac via SSH...        ║"
echo "  ╚══════════════════════════════════════╝"
echo ""
echo "  Enter your Mac password when prompted."
echo ""

ssh ${MAC_USER}@${MAC_IP}
