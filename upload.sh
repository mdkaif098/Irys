#!/bin/bash
set -e

CONFIG_FILE="$HOME/.irys_config"

# 1. Check if config file exists
if [[ -f "$CONFIG_FILE" ]]; then
    # Load saved private key and RPC
    source "$CONFIG_FILE"
else
    # Ask for private key and RPC URL first time
    while true; do
        echo "🔑 Enter your private key (64 hex characters, no 0x):"
        read PRIVATE_KEY
        if [[ ${#PRIVATE_KEY} -eq 64 ]]; then
            break
        else
            echo "❌ Invalid private key length. Try again."
        fi
    done

    while true; do
        echo "🌐 Enter your RPC URL (Sepolia RPC):"
        read RPC_URL
        if [[ -n "$RPC_URL" ]]; then
            break
        else
            echo "❌ RPC URL cannot be empty."
        fi
    done

    # Save to config file
    echo "IRYS_PRIVATE_KEY=$PRIVATE_KEY" > "$CONFIG_FILE"
    echo "IRYS_RPC_URL=$RPC_URL" >> "$CONFIG_FILE"
    chmod 600 "$CONFIG_FILE"
    echo "✅ Private key and RPC URL saved for future use."
fi

# 2. Upload File
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
