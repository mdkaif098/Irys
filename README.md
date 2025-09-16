# 🚀 Irys 1-Click Setup Script

This repository provides a simple **1-click installer** that installs, configures, and runs the Irys CLI on your server.  
It automatically sets up Node.js v20, all required dependencies, and Irys CLI — including wallet funding, balance check, and file upload.  

---

## ⚡ Quick Install (1-Click Command)

Run this command on your Ubuntu/Debian server:

```bash
curl -fsSL https://raw.githubusercontent.com/mdkaif098/Irys/main/setup.sh | bash
```

🔑 Please enter your private key (without 0x):
> abc123...

🌐 Please enter your RPC URL:
> https://rpc.ankr.com/eth

🏦 Please enter your Wallet Address to check balance:
> 0x1234abcd...

📂 Please enter the file path you want to upload:
> image.png

🖼️ Please enter the file format (example: PNG, JPG):
> PNG


## 📂 Daily Upload Script

Instead of typing long commands every day, use `upload.sh`.

### 🔸 How to Use
1. Download the script (once):
   ```bash
   curl -fsSL https://raw.githubusercontent.com/USERNAME/REPO_NAME/main/upload.sh -o upload.sh
   chmod +x upload.sh
   ```
2. Run the upload (daily):
> ./upload.sh FILE_NAME FILE_FORMAT PRIVATE_KEY RPC_URL

Example:
> ./upload.sh myimage jpg abc123... https://ethereum-devnet.io

