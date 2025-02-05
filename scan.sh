#!/bin/bash

# Colors for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RESET='\033[0m'

# Banner for Clays Scan 1.2
banner() {
    echo -e "${CYAN}###############################################"
    echo -e "#${GREEN}            Clays Scan 1.2                 ${CYAN}#"
    echo -e "#${YELLOW}      Web Vulnerability Scanner Tool       ${CYAN}#"
    echo -e "#${RED}       Powered by Clay's Cybersecurity      ${CYAN}#"
    echo -e "#${GREEN}           Instagram: h4cker.in            ${CYAN}#"
    echo -e "###############################################${RESET}"
}

# Custom shell prompt 1: claysshell
claysshell_prompt() {
    export PS1="${CYAN}[claysshell]${RESET} ${YELLOW}\u${RESET}@${BLUE}\h${RESET}:${GREEN}\w${RESET}$ "
}

# Custom shell prompt 2: user clays
userclays_prompt() {
    export PS1="${CYAN}[user clays]${RESET} ${YELLOW}\u${RESET}@${BLUE}\h${RESET}:${GREEN}\w${RESET}$ "
}

# Function for SQLMap scan
sqlmap_scan() {
    echo -e "${YELLOW}Running SQLMap scan...${RESET}"
    read -p "Enter the URL to scan (e.g., http://example.com/vulnerable_page.php?id=1): " target_url
    sqlmap -u "$target_url" --batch --risk=3 --level=5
}

# Function for Nmap scan
nmap_scan() {
    echo -e "${YELLOW}Running Nmap scan...${RESET}"
    read -p "Enter the URL or IP address to scan: " target_ip
    nmap -A "$target_ip"
}

# Function for Nikto scan
nikto_scan() {
    echo -e "${YELLOW}Running Nikto scan...${RESET}"
    read -p "Enter the URL to scan (e.g., http://example.com): " target_url
    nikto -h "$target_url"
}

# Function to start Metasploit
start_metasploit() {
    echo -e "${CYAN}Launching Metasploit Framework...${RESET}"
    msfconsole
}

# Function to start BeEF
start_beef() {
    echo -e "${CYAN}Launching BeEF (Browser Exploitation Framework)...${RESET}"
    beef-xss
}

# Function to start Burp Suite
start_burp() {
    echo -e "${CYAN}Launching Burp Suite...${RESET}"
    java -jar /path/to/burp/burpsuite.jar  # Adjust this path if necessary
}

# Main menu
main_menu() {
    banner
    echo -e "${CYAN}Please choose an option:${RESET}"
    echo -e "${GREEN}1.${RESET} SQLMap scan"
    echo -e "${GREEN}2.${RESET} Nmap scan"
    echo -e "${GREEN}3.${RESET} Nikto scan"
    echo -e "${GREEN}4.${RESET} Custom scan (Add your own tool)"
    echo -e "${GREEN}5.${RESET} Switch to custom terminal (user clays)"
    echo -e "${GREEN}6.${RESET} Launch Metasploit"
    echo -e "${GREEN}7.${RESET} Launch BeEF"
    echo -e "${GREEN}8.${RESET} Launch Burp Suite"
    echo -e "${GREEN}9.${RESET} Exit"
}

# Main loop
while true; do
    claysshell_prompt
    main_menu
    read -p "Enter your choice (1-9): " choice
    case $choice in
        1)
            sqlmap_scan
            ;;
        2)
            nmap_scan
            ;;
        3)
            nikto_scan
            ;;
        4)
            echo -e "${YELLOW}Custom scan functionality is under development. Please add your own tool commands.${RESET}"
            ;;
        5)
            echo -e "${CYAN}Switching to custom terminal (user clays)...${RESET}"
            userclays_prompt
            ;;
        6)
            start_metasploit
            ;;
        7)
            start_beef
            ;;
        8)
            start_burp
            ;;
        9)
            echo -e "${RED}Exiting... Goodbye!${RESET}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid choice. Please select a valid option.${RESET}"
            ;;
    esac
done
