#!/bin/bash
set -e

# 1. Private Key
echo "🔑 Enter your private key (without 0x):"
read PRIVATE_KEY

# 2. RPC URL
echo "🌐 Enter your RPC URL:"
read RPC_URL

# 3. Fund Wallet (optional)
echo "💸 Fund your wallet with 1,000,000 (Devnet)? [y/n]"
read FUND_CHOICE
if [[ "$FUND_CHOICE" == "y" || "$FUND_CHOICE" == "Y" ]]; then
    irys fund 1000000 -n devnet -t ethereum -w $PRIVATE_KEY --provider-url $RPC_URL
else
    echo "Skipping fund step..."
fi

# 4. Wallet Balance
echo "🏦 Enter your Wallet Address to check balance:"
read WALLET_ADDRESS
irys balance $WALLET_ADDRESS -t ethereum -n devnet --provider-url $RPC_URL

# 5. Upload File
echo "📂 Enter the file path you want to upload (example: image.png):"
read FILE_NAME
echo "🖼️ Enter the file format (example: PNG, JPG):"
read FILE_FORMAT

echo "🚀 Uploading file to Irys..."
irys upload $FILE_NAME -n devnet -t ethereum -w $PRIVATE_KEY --tags $FILE_NAME $FILE_FORMAT --provider-url $RPC_URL

echo "✅ All operations completed!"
