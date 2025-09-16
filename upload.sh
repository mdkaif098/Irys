#!/bin/bash
# ============================================
#   Irys Daily Upload Script
#   Author: MAFIA
#   Usage: ./upload.sh FILE_NAME FILE_FORMAT PRIVATE_KEY RPC_URL
# ============================================

if [ "$#" -ne 4 ]; then
  echo "❌ Usage: ./upload.sh FILE_NAME FILE_FORMAT PRIVATE_KEY RPC_URL"
  exit 1
fi

FILE_NAME=$1
FILE_FORMAT=$2
PRIVATE_KEY=$3
RPC_URL=$4

echo "🚀 Uploading $FILE_NAME.$FILE_FORMAT to Irys (devnet)..."

irys upload $FILE_NAME \
  -n devnet \
  -t ethereum \
  -w $PRIVATE_KEY \
  --tags $FILE_NAME $FILE_FORMAT \
  --provider-url $RPC_URL

echo "✅ Upload Completed!"
