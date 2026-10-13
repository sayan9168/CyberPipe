# 🛡️ CyberPipe

**All-in-One Cybersecurity Tools Pipeline for Non-Root Termux**

> Curated collection of the best cybersecurity tools from GitHub + Kali Linux that actually work on **non-rooted** Android Termux devices.

![Termux](https://img.shields.io/badge/Termux-Non--Root-brightgreen)
![License](https://img.shields.io/badge/License-MIT-blue)
![Platform](https://img.shields.io/badge/Platform-Android%20Termux-orange)

---

## ⚠️ Legal & Ethical Disclaimer

**This tool is strictly for educational purposes, authorized penetration testing, and security research only.**

- Only use on systems you own or have **explicit written permission** to test.
- Unauthorized access to computer systems is illegal under most jurisdictions (including IT Act 2000 in India).
- The authors take **zero responsibility** for any misuse.
- By using CyberPipe you agree to use it ethically and legally.

---

## ✨ Features

- **100% Non-Root** compatible tools
- One-command installer
- Beautiful interactive menu
- **Pipeline Mode** — chain tools automatically (Recon → Scan → Bruteforce → Exploit)
- Categories: Network, Web App, Password, OSINT, Android, Exploitation, Forensics
- Kali NetHunter Rootless support via proot-distro
- Auto dependency management
- Logging & result export
- Easily extensible

---

## 🚀 Quick Install (Termux)

```bash
pkg update -y && pkg upgrade -y
pkg install git curl wget -y
git clone https://github.com/sayan9168/CyberPipe.git
cd CyberPipe
chmod +x install.sh cyberpipe
./install.sh
```

After installation:

```bash
cyberpipe
```

---

## 📦 Included Tools (Non-Root Compatible)

### Network Scanning
| Tool | Description |
|------|-------------|
| nmap | Network discovery & port scanning (`-sT` mode) |
| masscan | Fast port scanner |
| netcat | Swiss army knife |
| traceroute / dig / whois | Basic networking |

### Web Application
| Tool | Description |
|------|-------------|
| sqlmap | Automatic SQL injection |
| dirsearch / gobuster | Directory & file bruteforcing |
| nikto | Web server scanner |
| whatweb | Technology fingerprinting |
| wfuzz | Web application fuzzer |
| subfinder / amass | Subdomain enumeration |
| httpx | HTTP probing |

### Password Attacks
| Tool | Description |
|------|-------------|
| hydra | Online password cracker |
| john | Offline password cracker |
| hashid | Hash identifier |
| cewl | Custom wordlist generator |
| cupp | Targeted wordlist creator |

### OSINT & Recon
| Tool | Description |
|------|-------------|
| theHarvester | Emails, subdomains, names |
| sherlock | Username search across social networks |
| recon-ng | Full recon framework |
| holehe | Email to social media accounts |
| phoneinfoga | Phone number OSINT |

### Exploitation & Frameworks
| Tool | Description |
|------|-------------|
| metasploit | Limited (no DB) but works |
| routersploit | Router exploitation |
| phonesploit | Android ADB exploitation |
| searchsploit | Exploit-DB offline search |

### Android Specific
| Tool | Description |
|------|-------------|
| apktool | APK reverse engineering |
| jadx | Dex to Java decompiler |
| frida (limited) | Dynamic instrumentation |

### Extra Power
- **Kali NetHunter Rootless** via `proot-distro` (full Kali userland without root)

---

## 🔥 Pipeline Mode Examples

```bash
# Full domain pipeline
cyberpipe pipeline domain example.com

# Network scan pipeline
cyberpipe pipeline network 192.168.1.0/24

# Web app pipeline
cyberpipe pipeline web https://target.com
```

Pipelines automatically chain:
1. Subdomain enumeration
2. Port scanning
3. Technology detection
4. Directory bruteforce
5. Vulnerability checks

---

## 📁 Project Structure

```
CyberPipe/
├── install.sh              # Full installer
├── cyberpipe               # Main launcher (menu + CLI)
├── tools/
│   ├── install_all.sh      # Install every tool
│   ├── categories.json     # Tool definitions
│   └── managers/           # Per-category installers
├── lib/
│   ├── colors.sh
│   ├── logger.sh
│   └── utils.sh
├── pipelines/
│   ├── domain.sh
│   ├── network.sh
│   └── web.sh
└── docs/
```

---

## 🛠️ Manual Tool Installation

```bash
cyberpipe install network     # Install only network tools
cyberpipe install web         # Web tools
cyberpipe install password    # Password tools
cyberpipe install osint       # OSINT tools
cyberpipe install all         # Everything
```

---

## 🖥️ Kali NetHunter Rootless

```bash
cyberpipe kali-install
# After install:
nethunter
# or
proot-distro login nethunter
```

---

## 🤝 Contributing

Pull requests are welcome!  
Add new non-root compatible tools in `tools/categories.json` and submit a PR.

---

## 📜 License

MIT License — see [LICENSE](LICENSE)

---

**Made with ❤️ for ethical security researchers by Sayan**

> Stay legal. Stay ethical. Stay curious. 🛡️
