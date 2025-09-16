#!/bin/bash
set -e

# 1. Private Key
while true; do
  echo "🔑 Enter your private key (64 hex characters, no 0x):"
  read PRIVATE_KEY
  if [[ ${#PRIVATE_KEY} -eq 64 ]]; then
    break
  else
    echo "❌ Invalid private key length. Try again."
  fi
done

# 2. RPC URL
while true; do
  echo "🌐 Enter your RPC URL (Sepolia RPC):"
  read RPC_URL
  if [[ -n "$RPC_URL" ]]; then
    break
  else
    echo "❌ RPC URL cannot be empty."
  fi
done

# 3. Fund Wallet (Optional)
echo "💸 Fund your wallet (Devnet)? [y/n]"
read FUND_CHOICE
if [[ "$FUND_CHOICE" == "y" || "$FUND_CHOICE" == "Y" ]]; then
    irys fund 1000000 -n devnet -t ethereum -w $PRIVATE_KEY --provider-url $RPC_URL || echo "Skipping fund step..."
else
    echo "Skipping fund step..."
fi

# 4. Wallet Balance
while true; do
  echo "🏦 Enter your Wallet Address to check balance:"
  read WALLET_ADDRESS
  if [[ -n "$WALLET_ADDRESS" ]]; then
    break
  else
    echo "❌ Wallet Address cannot be empty."
  fi
done
irys balance $WALLET_ADDRESS -t ethereum -n devnet --provider-url $RPC_URL

# 5. Upload File
while true; do
  echo "📂 Enter the file path you want to upload (example: image.png):"
  read FILE_NAME
  if [[ -f "$FILE_NAME" ]]; then
    break
  else
    echo "❌ File does not exist. Try again."
  fi
done

echo "🖼️ Enter the file format (example: PNG, JPG):"
read FILE_FORMAT

echo "🚀 Uploading file to Irys..."
irys upload $FILE_NAME -n devnet -t ethereum -w $PRIVATE_KEY --tags $FILE_NAME $FILE_FORMAT --provider-url $RPC_URL

echo "✅ All operations completed!"
