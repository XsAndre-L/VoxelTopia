#!/bin/bash
# Source the colors.sh file
source ./util/terminal/bash_color.sh

mkdir ./manager/tools \ 

curl -L -o ./manager/tools/vs_community.exe https://aka.ms/vs/17/release/vs_community.exe

echo -e "${GREEN}Visual Studio Installer is opening ...${RESET}"
echo -e "${CYAN}Install: ${MAGENTA}${BOLD}Something ${RESET}"

./tools/vs_community.exe

# curl -L -o ./setup/vs_buildtools.exe https://aka.ms/vs/17/release/vs_buildtools.exe
