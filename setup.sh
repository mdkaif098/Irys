#!/bin/bash
set -e

echo "🔄 Updating system packages..."
sudo apt-get update && sudo apt-get upgrade -y

echo "📦 Installing required dependencies..."
sudo apt install curl iptables build-essential git wget lz4 jq make protobuf-compiler cmake gcc nano automake autoconf tmux htop nvme-cli libgbm1 pkg-config libssl-dev libleveldb-dev tar clang bsdmainutils ncdu unzip screen ufw -y

echo "⬇️ Installing Node.js v20..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

echo "✅ Verifying Node.js installation..."
node -v
npm -v

echo "⚡ Installing Irys CLI globally..."
sudo npm i -g @irys/cli

echo "✅ Verifying Irys CLI installation..."
irys

echo "🎉 Installation complete..!"
