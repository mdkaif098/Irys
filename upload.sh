#!/bin/bash
set -e

echo "🔑 Enter your private key (without 0x):"
read PRIVATE_KEY

echo "🌐 Enter your RPC URL:"
read RPC_URL

echo "💸 Fund your wallet (Devnet) [optional]:"
irys fund 1000000 -n devnet -t ethereum -w $PRIVATE_KEY --provider-url $RPC_URL || echo "Skipping fund step..."

echo "🏦 Enter your Wallet Address to check balance:"
read WALLET_ADDRESS
irys balance $WALLET_ADDRESS -t ethereum -n devnet --provider-url $RPC_URL

echo "📂 Enter the file path you want to upload (example: image.png):"
read FILE_NAME
echo "🖼️ Enter the file format (example: PNG, JPG):"
read FILE_FORMAT

echo "🚀 Uploading file to Irys..."
irys upload $FILE_NAME -n devnet -t ethereum -w $PRIVATE_KEY --tags $FILE_NAME $FILE_FORMAT --provider-url $RPC_URL

echo "✅ All operations completed!"
