#!/bin/bash
# Source the colors.sh file
source ./util/terminal/bash_color.sh

# mkdir ./manager/tools \
# Create the tools directory
mkdir -p ./manager/tools
if [ $? -ne 0 ]; then
  echo -e "${RED}Failed to create directory ./manager/tools${RESET}"
  exit 1
fi

curl -L -o ./manager/tools/vs_community.exe https://aka.ms/vs/17/release/vs_community.exe
if [ $? -ne 0 ]; then
  echo -e "${RED}Failed to download Visual Studio Installer${RESET}"
  exit 1
fi

echo -e "${GREEN}Visual Studio Installer is opening ...${RESET}"
echo -e "${CYAN}Install: ${MAGENTA}${BOLD}Something ${RESET}"

./manager/tools/vs_community.exe

# curl -L -o ./setup/vs_buildtools.exe https://aka.ms/vs/17/release/vs_buildtools.exe
