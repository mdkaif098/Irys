# 🚀 Irys 1-Click Setup Script

This repository provides a simple **1-click installer** that installs, configures, and runs the Irys CLI on your server.  
It automatically sets up Node.js v20, all required dependencies, and Irys CLI — including wallet funding, balance check, and file upload.  

---

## ⚡ Quick Install (1-Click Command)

Run this command on your Ubuntu/Debian server:

```bash
curl -fsSL https://raw.githubusercontent.com/mdkaif098/Irys/main/setup.sh | bash
```

## 💸 Wallet Fund & Balance Check

If you want to **fund your wallet (Devnet)** or **check your balance**, use these commands separately:

### 🔹 Fund Wallet (Devnet)
```bash
irys fund 1000000 -n devnet -t ethereum -w PRIVATE_KEY --provider-url RPC_URL
```

### 🔹 Check Wallet Balance
```bash
irys balance WALLET_ADDRESS -t ethereum -n devnet --provider-url RPC_URL
```
> PRIVATE_KEY → your private key (without 0x)

> RPC_URL → your RPC endpoint

> WALLET_ADDRESS → your wallet address

## 📂 Daily Upload Script

Instead of typing long commands every day, use `upload.sh`.

### 🔸 How to Use
1. Download the script (once):
   ```bash
   curl -fsSL https://raw.githubusercontent.com/mdkaif098/Irys/main/upload.sh -o upload.sh
   chmod +x upload.sh
   ```
2. Run the upload (daily):
> ./upload.sh FILE_NAME FILE_FORMAT PRIVATE_KEY RPC_URL

Example:
> ./upload.sh myimage jpg abc123... https://ethereum-devnet.io

## 📢 Community & Support

Stay connected and get updates:

💬 Join our Telegram Channel: https://t.me/kind_cr

🐦 Follow us on X (Twitter): https://x.com/Mohamma34525340 & https://x.com/armaanbhat201

▶️ YouTube: https://www.youtube.com/@KindCrypto
