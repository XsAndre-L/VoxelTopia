#!/bin/bash
# Source the colors.sh file
source ./util/terminal/bash_color.sh

git clone https://github.com/microsoft/vcpkg.git
cd vcpkg && ./bootstrap-vcpkg.sh

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Set VCPKG_ROOT relative to the script's directory
VCPKG_ROOT="$SCRIPT_DIR/vcpkg"
export VCPKG_ROOT
# CMAKE_TOOLCHAIN_FILE": "${env:VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"

# Set the toolchain file path
CMAKE_TOOLCHAIN_FILE="$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake"
export CMAKE_TOOLCHAIN_FILE

cd ./vcpkg
./bootstrap-vcpkg.sh
./vcpkg install zlib zstd curl[winssl] openal-soft libvorbis libogg libjpeg-turbo sqlite3 freetype luajit gmp jsoncpp gettext[tools] sdl2 --triplet x64-windows --recurse

# cd ..
# cmake --preset Debug -S . -B build/debug
# Automate later.... TODO

echo -e "${GREEN}Done${RESET}"
echo -e "${CYAN}Now set ${MAGENTA}${BOLD}CMake: Select Configure Preset ${RESET}${CYAN}to '${BOLD}Debug${RESET}${CYAN}'${RESET}"
echo -e "${CYAN}Then ${MAGENTA}${BOLD}CMake: Configure${RESET}"
echo -e "${CYAN}And finally ${MAGENTA}${BOLD}CMake: Build All${RESET}"
