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

info "Launching archinstall interactive installer..."
info ""
info "Follow the prompts to:"
info "  1. Select your installation disk"
info "  2. Choose partitioning scheme"
info "  3. Configure localization & timezone"
info "  4. Set root password"
info "  5. Create user account"
info "  6. Select packages (CachyOS kernel will be added)"
info ""
success "Starting archinstall..."
info ""

# Run archinstall interactively - user configures everything
archinstall

if [ $? -eq 0 ]; then
    success "Base system installation completed!"
    info ""
    info "Setting up BorOS-specific configuration..."
    
    # Create post-installation script to install CachyOS kernel
    POST_INSTALL="/tmp/boros-post-install.sh"
    cat > "$POST_INSTALL" << 'POSTINSTALL'
#!/bin/bash
# BorOS Post-Installation Setup

# Replace default kernel with CachyOS
echo "Installing CachyOS kernel..."
pacman -Sy --noconfirm linux-cachyos linux-cachyos-headers

# Remove default linux kernel if present
pacman -R --noconfirm linux || true

# Set hostname to BorOS
hostnamectl set-hostname boros
hostnamectl set-pretty-hostname "BorOS"

# Add BorOS branding
echo "setup_boros_branding() {
    cat << 'EOF'
    ╔═══════════════════════════════════════╗
    ║              🛡️  BorOS  ✏️               ║
    ║   Performance Linux Distribution     ║
    ║        Powered by CachyOS Kernel    ║
    ╚═══════════════════════════════════════╝
EOF
}" >> /etc/profile.d/boros.sh

echo "BorOS installation complete!"
echo "Kernel: $(uname -r)"
POSTINSTALL
    
    info "Post-installation script created"
    success "BorOS installation completed successfully!"
    info ""
    success "Your system is ready!"
    info ""
    info "After reboot, run:"
    info "  sudo bash /tmp/boros-post-install.sh"
    info ""
    info "Or install CachyOS kernel manually:"
    info "  sudo pacman -S linux-cachyos linux-cachyos-headers"
    info "  sudo pacman -R linux"
    info ""
    info "Repository: https://github.com/theclassiclol/boros-archinstall"
else
    error "Installation was cancelled or failed"
    exit 1
fi
