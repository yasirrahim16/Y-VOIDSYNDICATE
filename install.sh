#!/bin/bash

# Y-VOIDSYNDICATE Auto-Installer
# Written for Termux & Kali Linux

echo "-----------------------------------"
echo "Setting up Y-VOIDSYNDICATE..."
echo "-----------------------------------"

# 1. Update System
echo "[+] Updating Repositories..."
pkg update && pkg upgrade -y

# 2. Install Dependencies
echo "[+] Installing PHP and Dependencies..."
pkg install php git wget curl -y

# 3. Check for Cloudflared (Tunneling)
if ! command -v cloudflared &> /dev/null
then
    echo "[+] Installing Cloudflared..."
    wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64
    mv cloudflared-linux-arm64 cloudflared
    chmod +x cloudflared
else
    echo "[+] Cloudflared is already installed."
fi

echo "-----------------------------------"
echo "Setup Complete!"
echo "Run your tool using: php -S 127.0.0.1:8080"
echo "-----------------------------------"

