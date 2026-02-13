#!/bin/bash
#
# BorOS One-Command Installation
# Download and run with: curl -fsSL https://github.com/theclassiclol/boros-archinstall/raw/main/install-boros.sh | bash
#

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_info() {
    echo -e "${BLUE}[*]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

# Check if running as root
if [[ $EUID -ne 0 ]]; then
    print_error "This script must be run as root"
    print_info "Try: sudo bash install-boros.sh"
    exit 1
fi

print_info "BorOS Installation Bootstrap"
print_info "Installing dependencies..."

# Install required packages
pacman -Sy --noconfirm git curl archinstall

print_info ""
print_info "Downloading BorOS installer from GitHub..."

# Create temporary directory
INSTALL_DIR="/tmp/boros-install"
rm -rf "$INSTALL_DIR"
mkdir -p "$INSTALL_DIR"

# Clone the installer
if git clone https://github.com/theclassiclol/boros-archinstall "$INSTALL_DIR" --depth 1; then
    print_success "Downloaded successfully"
    print_info ""
    print_info "Starting BorOS installation..."
    print_info "Follow the interactive archinstall prompts"
    print_info ""
    bash "$INSTALL_DIR/install.sh"
    EXIT_CODE=$?
    rm -rf "$INSTALL_DIR"
    exit $EXIT_CODE
else
    print_error "Failed to download BorOS installer"
    exit 1
fi
