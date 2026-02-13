#!/bin/bash
#
# BorOS Archinstall - Custom Distribution Installer
# ==================================================
# Official Repository: https://github.com/theclassiclol/boros-archinstall
# 

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logo
print_logo() {
    echo -e "${BLUE}"
    cat << "EOF"
    ╔═══════════════════════════════════════╗
    ║       Welcome to BorOS Installer      ║
    ║   Custom Linux Distribution v1.0     ║
    ╚═══════════════════════════════════════╝
EOF
    echo -e "${NC}"
}

# Function to display info
info() {
    echo -e "${BLUE}[*]${NC} $1"
}

# Function to display success
success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

# Function to display error
error() {
    echo -e "${RED}[✗]${NC} $1"
}

# Function to display warning
warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_logo

# Check if running as root
if [[ $EUID -ne 0 ]]; then
    error "This script must be run as root"
    exit 1
fi

# Check if archinstall is available
if ! command -v archinstall &> /dev/null; then
    error "archinstall is not installed. Please install it first."
    info "Run: pacman -S archinstall"
    exit 1
fi

info "Starting BorOS Installation..."
info "Kernel: CachyOS"
info "Distribution: BorOS"

# Create temporary directory for configurations
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

info "Downloading configuration from GitHub..."

# Clone the BorOS configuration
if git clone https://github.com/theclassiclol/boros-archinstall "$TEMP_DIR/boros-config" --depth 1; then
    success "Configuration downloaded successfully"
else
    error "Failed to clone configuration from GitHub"
    exit 1
fi

# Define BorOS profile configuration
info "Setting up BorOS profile..."

# Create archinstall configuration
CONFIG_FILE="$TEMP_DIR/boros-profile.json"
cat > "$CONFIG_FILE" << 'HEREDOC'
{
  "version": "2.4",
  "archinstall-language": "english",
  "timezone": "UTC",
  "keyboard-layout": "us",
  "mirror-region": {
    "auto": true
  },
  "bootloader": "grub",
  "cpu-ucode": "auto",
  "disk_encryption": null,
  "filesystems": {
    "/dev/sda": {
      "partitions": [
        {
          "size": "550MiB",
          "type": "EFI System Partition",
          "mountpoint": "/boot"
        },
        {
          "size": "100%",
          "type": "Linux filesystem",
          "mountpoint": "/"
        }
      ]
    }
  },
  "hostname": "boros",
  "kernel": "linux-cachyos",
  "locale": ["en_US.UTF-8"],
  "packages": [
    "base",
    "linux-cachyos",
    "linux-cachyos-headers",
    "networkmanager",
    "grub",
    "efibootmgr",
    "git",
    "vim",
    "nano",
    "htop",
    "curl",
    "wget",
    "base-devel"
  ],
  "profile": "minimal",
  "sudo": true,
  "swap": true,
  "timezone": "UTC"
}
HEREDOC

info "Launching archinstall with BorOS configuration..."
info "This will now open the archinstall interactive installer"
info "You can customize installation options as needed"

# Run archinstall with the BorOS configuration
archinstall \
    --config="$CONFIG_FILE" \
    --creds-root=password \
    --creds-user=password

if [ $? -eq 0 ]; then
    success "BorOS installation completed successfully!"
    success "Your system is ready. Reboot to complete setup."
    info "Repository: https://github.com/theclassiclol/boros-archinstall"
else
    error "Installation failed or was cancelled"
    exit 1
fi
