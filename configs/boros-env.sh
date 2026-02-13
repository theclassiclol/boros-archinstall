#!/bin/bash
# BorOS Environment Configuration
# Source this file in your shell profile to enable BorOS-specific aliases and environment variables

# BorOS Information
export BOROS_VERSION="1.0"
export BOROS_REPO="https://github.com/theclassiclol/boros-archinstall"

# Color definitions for BorOS branding
export BOROS_PRIMARY="#0066cc"     # Blue
export BOROS_SECONDARY="#8b0000"   # Dark Red
export BOROS_ACCENT="#d4af37"      # Gold

# Useful aliases
alias boros-info="echo 'BorOS v$BOROS_VERSION | Kernel: $(uname -r) | Packages: $(pacman -Qq | wc -l)'"
alias boros-update="sudo pacman -Syu"
alias boros-install="sudo pacman -S"
alias boros-remove="sudo pacman -Rns"
alias boros-search="pacman -Ss"

# Function to display BorOS logo
boros-logo() {
    cat << 'EOF'
    ╔═══════════════════════════════════════╗
    ║              🛡️  BorOS  ✏️               ║
    ║   Performance Linux Distribution     ║
    ║        Powered by CachyOS Kernel    ║
    ╚═══════════════════════════════════════╝
EOF
}

# Display on shell startup
boros-logo

echo "BorOS environment loaded. Use 'boros-info' for system information."
