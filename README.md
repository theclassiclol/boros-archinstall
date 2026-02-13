# BorOS Archinstall

Custom Archinstall script for BorOS - a specialized Linux distribution based on Arch Linux with CachyOS kernel optimization.

## Features

- 🚀 **CachyOS Kernel**: High-performance optimized kernel for better system responsiveness
- 🐍 **BorOS Branding**: Completely rebranded from Arch Linux to BorOS
- 📦 **One-Command Installation**: Easy installation directly from GitHub
- 🔧 **Customizable**: Modular installation profiles for different use cases
- 🖥️ **Modern Installer**: Uses archinstall for seamless setup experience

## Quick Start

### Option 1: Single Command (Recommended)

```bash
sudo bash <(curl -fsSL https://github.com/theclassiclol/boros-archinstall/raw/main/install-boros.sh)
```

### Option 2: Clone and Install

```bash
# Clone the repository
git clone https://github.com/theclassiclol/boros-archinstall
cd boros-archinstall

# Make script executable
chmod +x install.sh

# Run installation
sudo ./install.sh
```

## System Requirements

- UEFI or BIOS firmware
- At least 2GB of RAM (4GB recommended)
- 20GB of free disk space minimum
- Internet connection for package downloads
- Live Arch ISO or BorOS Live ISO

## What Gets Installed

### Kernel
- `linux-cachyos` - Performance-optimized kernel
- `linux-cachyos-headers` - Kernel headers for module compilation

### Base System
- Base system utilities
- NetworkManager
- GRUB bootloader
- Build tools for AUR packages
- Essential command-line tools

### Customization

The installer supports multiple profiles in the `profiles/` directory. You can create custom profiles for different system types (desktop, server, minimal, etc.).

## Configuration

Configuration files are located in the `configs/` directory:

- `packages.txt` - List of packages to install
- `mirrors.conf` - Package mirror configuration
- `locale.conf` - Locale and timezone settings

## Logo

The official BorOS logo is included in the `assets/` directory and is used throughout the installer interface.

## Repository Structure

```
boros-archinstall/
├── install.sh              # Main installation script
├── install-boros.sh        # One-command bootstrap script
├── README.md              # This file
├── profiles/              # Installation profiles
│   └── minimal/          # Minimal installation profile
├── configs/              # Configuration templates
│   ├── packages.txt      # Package list
│   ├── locale.conf       # Locale configuration
│   └── mirrors.conf      # Mirror settings
└── assets/               # Images and branding
    └── logo/            # BorOS logo files
```

## Troubleshooting

### Archinstall not found
Install archinstall first:
```bash
pacman -S archinstall
```

### Permission denied
Make sure you're running with sudo:
```bash
sudo ./install.sh
```

### Network issues during installation
Check your internet connection and try again. The installer will restart the download process if needed.

## Support and Contributions

- 📧 Issues: Report bugs on GitHub
- 🔗 Repository: https://github.com/theclassiclol/boros-archinstall
- 💬 Discussions: GitHub Discussions

## License

BorOS Archinstall - Custom Distribution Installer
© 2026

Based on Arch Linux installation process with custom modifications and CachyOS kernel integration.

---

**Last Updated**: February 2026
**Version**: 1.0
**Kernel**: CachyOS
