# BorOS Archinstall Configuration

This directory contains the main configuration and installation files for BorOS.

## Quick Reference

### Main Files

- **install.sh** - Main installation script (run with `sudo`)
- **install-boros.sh** - Single-command bootstrap script
- **boros-sysinfo.sh** - System information utility
- **boros-env.sh** - BorOS environment configuration

### Key Directories

- **profiles/** - Installation profiles (minimal, desktop, etc.)
- **configs/** - Configuration files (packages, locale, environment)
- **assets/** - Branding assets (logo, images)

## Installation

### From Live Arch ISO

```bash
# Method 1: Direct command
sudo bash <(curl -fsSL https://github.com/theclassiclol/boros-archinstall/raw/main/install-boros.sh)

# Method 2: Clone and run
git clone https://github.com/theclassiclol/boros-archinstall
cd boros-archinstall
sudo ./install.sh
```

## What's Included

✅ **CachyOS Kernel** - High-performance optimized kernel
✅ **BorOS Branding** - Complete rebranding from Arch
✅ **Archinstall Integration** - Automated installation process
✅ **Multiple Profiles** - Minimal, Desktop, and custom configurations
✅ **Documentation** - Comprehensive guides and setup instructions
✅ **GitHub Integration** - Easy cloning and one-command installation

## BorOS Specifics

- **Distribution Name**: BorOS
- **Kernel**: linux-cachyos with linux-cachyos-headers
- **Base System**: Arch Linux packages with CachyOS optimizations
- **Package Manager**: pacman
- **Init System**: systemd
- **Bootloader**: GRUB

## Customization

### Modify Packages
Edit `configs/packages.txt` to change default packages

### Create Custom Profile
Create a new directory in `profiles/[name]/` with `profile.conf`

### Change Branding
Update logo in `assets/logo/` and references in installation scripts

## Support

- 📖 README.md - Getting started guide
- 📋 INSTALLATION_GUIDE.md - Detailed installation instructions
- 🔧 GITHUB_SETUP.md - Repository setup guide
- 🤝 CONTRIBUTING.md - How to contribute

---

**BorOS v1.0** | CachyOS Kernel | February 2026
