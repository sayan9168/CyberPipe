#!/data/data/com.termux/files/usr/bin/bash

# CyberPipe Installer - Non-Root Termux Cybersecurity Pipeline
# Author: Sayan (sayan9168)
# License: MIT

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'
BOLD='\033[1m'

banner() {
    clear
    echo -e "${CYAN}"
    cat << "EOF"
   ____      _               ____  _            
  / ___|   _| |__   ___ _ __|  _ \(_)_ __   ___ 
 | |  | | | | '_ \ / _ \ '__| |_) | | '_ \ / _ \
 | |__| |_| | |_) |  __/ |  |  __/| | |_) |  __/
  \____\__, |_.__/ \___|_|  |_|   |_| .__/ \___|
       |___/                        |_|         
EOF
    echo -e "${NC}"
    echo -e "${BOLD}${GREEN}  All-in-One Cybersecurity Pipeline for Non-Root Termux${NC}"
    echo -e "${YELLOW}  Educational & Authorized Use Only${NC}"
    echo ""
}

check_termux() {
    if [ -z "$PREFIX" ] || [ ! -d "$PREFIX" ]; then
        echo -e "${RED}[!] This script must be run inside Termux${NC}"
        exit 1
    fi
    echo -e "${GREEN}[\u2713] Termux environment detected${NC}"
}

update_system() {
    echo -e "${BLUE}[*] Updating Termux packages...${NC}"
    pkg update -y && pkg upgrade -y
    echo -e "${GREEN}[\u2713] System updated${NC}"
}

install_core() {
    echo -e "${BLUE}[*] Installing core dependencies...${NC}"
    pkg install -y \
        git curl wget python python-pip \
        nmap netcat-openbsd \
        openssh proot proot-distro \
        jq tmux nano vim \
        clang make pkg-config \
        dnsutils whois traceroute \
        coreutils findutils grep \
        unzip zip tar \
        termux-api 2>/dev/null || true

    # Python packages
    pip install --upgrade pip setuptools wheel
    pip install requests colorama rich tqdm python-nmap

    echo -e "${GREEN}[\u2713] Core packages installed${NC}"
}

setup_dirs() {
    echo -e "${BLUE}[*] Setting up directories...${NC}"
    mkdir -p $HOME/.cyberpipe/{logs,results,wordlists,tools}
    mkdir -p $HOME/.cyberpipe/results/{nmap,web,osint,password}
    
    # Symlink
    if [ ! -f $PREFIX/bin/cyberpipe ]; then
        ln -sf $(pwd)/cyberpipe $PREFIX/bin/cyberpipe
        chmod +x $PREFIX/bin/cyberpipe
    fi
    
    # Copy configs
    cp -r tools lib pipelines $HOME/.cyberpipe/ 2>/dev/null || true
    
    echo -e "${GREEN}[\u2713] Directories ready${NC}"
}

install_wordlists() {
    echo -e "${BLUE}[*] Downloading common wordlists...${NC}"
    cd $HOME/.cyberpipe/wordlists
    
    if [ ! -f rockyou.txt ]; then
        echo -e "${YELLOW}[!] rockyou.txt is large. Downloading small common lists instead...${NC}"
        curl -sL https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/common.txt -o common.txt || true
        curl -sL https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10k-most-common.txt -o 10k-passwords.txt || true
        curl -sL https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/subdomains-top1million-5000.txt -o subdomains-5k.txt || true
    fi
    echo -e "${GREEN}[\u2713] Wordlists ready${NC}"
}

show_menu() {
    echo ""
    echo -e "${BOLD}${CYAN}What do you want to install?${NC}"
    echo ""
    echo -e "  ${GREEN}1${NC}) Full install (Recommended) — All tools + pipelines"
    echo -e "  ${GREEN}2${NC}) Network tools only"
    echo -e "  ${GREEN}3${NC}) Web Application tools"
    echo -e "  ${GREEN}4${NC}) Password + OSINT tools"
    echo -e "  ${GREEN}5${NC}) Kali NetHunter Rootless only"
    echo -e "  ${GREEN}6${NC}) Just setup CyberPipe launcher (no extra tools)"
    echo -e "  ${GREEN}0${NC}) Exit"
    echo ""
    read -p "Select option [1]: " choice
    choice=${choice:-1}
    
    case $choice in
        1)
            bash tools/install_all.sh
            ;;
        2)
            bash tools/install_network.sh
            ;;
        3)
            bash tools/install_web.sh
            ;;
        4)
            bash tools/install_osint_password.sh
            ;;
        5)
            bash tools/install_kali.sh
            ;;
        6)
            echo -e "${GREEN}[\u2713] Launcher only installed${NC}"
            ;;
        0)
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid choice${NC}"
            show_menu
            ;;
    esac
}

final_message() {
    echo ""
    echo -e "${GREEN}\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550${NC}"
    echo -e "${BOLD}${GREEN}  CyberPipe installed successfully!${NC}"
    echo -e "${GREEN}\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550${NC}"
    echo ""
    echo -e "  Run:  ${CYAN}cyberpipe${NC}"
    echo -e "  or:   ${CYAN}./cyberpipe${NC}"
    echo ""
    echo -e "${YELLOW}  Remember: Only use on authorized targets.${NC}"
    echo ""
}

# Main
banner
check_termux
update_system
install_core
setup_dirs
install_wordlists
show_menu
final_message
