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

echo "🔑 Please enter your private key (without 0x):"
read PRIVATE_KEY

echo "🌐 Please enter your RPC URL:"
read RPC_URL

echo "💸 Funding Irys wallet with 1,000,000 on Devnet..."
irys fund 1000000 \
  -n devnet \
  -t ethereum \
  -w $PRIVATE_KEY \
  --provider-url $RPC_URL

echo "🏦 Please enter your Wallet Address to check balance:"
read WALLET_ADDRESS

echo "💰 Checking balance of wallet..."
irys balance $WALLET_ADDRESS \
  -t ethereum \
  -n devnet \
  --provider-url $RPC_URL

echo "📂 Please enter the file path you want to upload (example: image.png):"
read FILE_NAME

echo "🖼️ Please enter the file format (example: PNG, JPG):"
read FILE_FORMAT

echo "🚀 Uploading file to Irys..."
irys upload $FILE_NAME \
  -n devnet \
  -t ethereum \
  -w $PRIVATE_KEY \
  --tags $FILE_NAME $FILE_FORMAT \
  --provider-url $RPC_URL
