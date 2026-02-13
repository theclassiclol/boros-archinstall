# BorOS Installation Guide

## Pre-Installation Requirements

### System Requirements
- **Processor**: 64-bit processor
- **RAM**: Minimum 2GB (4GB recommended)
- **Storage**: 20GB free space minimum (50GB recommended)
- **Firmware**: UEFI or BIOS
- **Internet**: Active internet connection during installation

### Live Media
- Boot from Arch Linux live USB
- Or use BorOS Live ISO if available

## Installation Methods

### Method 1: One-Command Installation (Live USB)

Boot from Arch Linux Live USB and run:

```bash
sudo bash <(curl -fsSL https://github.com/theclassiclol/boros-archinstall/raw/main/install-boros.sh)
```

**Advantages**:
- Single command
- Fully automated
- Everything configured

**Time**: ~10-15 minutes depending on internet speed

### Method 2: Manual Installation

1. **Boot from live USB**
```bash
# Wait for Arch boot to complete
# You'll see the prompt starting with 'root@archiso'
```

2. **Connect to internet** (if not automatic)
```bash
# Check connection
ping archlinux.org

# If needed, configure network
nmtui  # Network Manager TUI
```

3. **Clone and run installer**
```bash
# Install git first
pacman -Sy git curl

# Clone the installer
git clone https://github.com/theclassiclol/boros-archinstall /tmp/boros

# Run installation
sudo bash /tmp/boros/install.sh
```

4. **Follow the interactive installer**
- Select disk to install on
- Choose partitioning scheme
- Set user credentials
- Confirm installation

5. **Reboot**
```bash
reboot
```

## Post-Installation

### First Boot
1. Remove USB drive
2. System boots into GRUB
3. Select BorOS to boot
4. You'll see the login prompt

### Initial Setup
```bash
# Log in with your credentials
# Update system packages
sudo pacman -Syu

# Install additional software if needed
sudo pacman -S [package-name]

# Enable NetworkManager (if not started)
sudo systemctl enable --now NetworkManager
```

### Verify Installation
```bash
# Check kernel
uname -r  # Should show linux-cachyos

# Check distribution
hostnamectl  # Should show BorOS

# Check installed packages
pacman -Qq | wc -l  # Count installed packages
```

## Customization

### Install Desktop Environment (Optional)

**GNOME** (Recommended):
```bash
sudo pacman -S gnome gnome-extra gdm
sudo systemctl enable gdm
sudo reboot
```

**KDE Plasma**:
```bash
sudo pacman -S plasma kde-applications sddm
sudo systemctl enable sddm
sudo reboot
```

**XFCE** (Lightweight):
```bash
sudo pacman -S xfce4 xfce4-goodies lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm
sudo reboot
```

### Install Development Tools
```bash
# Development essentials
sudo pacman -S base-devel git vim neovim

# Python development
sudo pacman -S python python-pip python-virtualenv

# Node.js development
sudo pacman -S nodejs npm

# Rust development
sudo pacman -S rustup
```

### AUR (Arch User Repository)
```bash
# Install an AUR helper (yay)
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Use yay to install AUR packages
yay -S [aur-package-name]
```

## Troubleshooting

### Installation Fails
1. Verify internet connection
2. Check disk space with `df -h`
3. Try manual installation method
4. Check GitHub issues: https://github.com/theclassiclol/boros-archinstall/issues

### Boot Issues
```bash
# Reinstall GRUB
sudo grub-install /dev/sda  # Replace sda with your disk
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Rebuild initramfs
sudo mkinitcpio -p linux-cachyos
```

### Network Issues
```bash
# Restart NetworkManager
sudo systemctl restart NetworkManager

# Check status
systemctl status NetworkManager

# Reconfigure network
nmtui
```

### Kernel Panic
Boot into GRUB recovery mode and select fallback options. Then:
```bash
sudo pacman -U https://archive.archlinux.org/packages/l/linux-cachyos/linux-cachyos-VERSION-ARCH.pkg.tar.zst
```

## Support

- 📖 Wiki: https://github.com/theclassiclol/boros-archinstall/wiki
- 🐛 Report Issues: https://github.com/theclassiclol/boros-archinstall/issues
- 💬 Discussions: https://github.com/theclassiclol/boros-archinstall/discussions
- 📧 Contact: Check GitHub profile for contact info

---

**Distribution**: BorOS v1.0
**Kernel**: CachyOS
**Last Updated**: February 2026
