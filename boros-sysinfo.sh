#!/bin/bash
#
# BorOS System Information Script
# Displays detailed BorOS installation information
#

set -e

# Colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Functions
print_header() {
    echo -e "${BLUE}═══════════════════════════════════════${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}═══════════════════════════════════════${NC}"
}

print_info() {
    printf "%-30s ${GREEN}%s${NC}\n" "$1" "$2"
}

print_header "BorOS System Information"

# OS Information
if [ -f /etc/os-release ]; then
    . /etc/os-release
    print_info "Distribution:" "$NAME"
    if [ -z "$VERSION_CODENAME" ]; then
        print_info "Version:" "$VERSION"
    else
        print_info "Codename:" "$VERSION_CODENAME"
    fi
fi

echo

# Kernel Information
print_header "Kernel Details"
KERNEL=$(uname -r)
print_info "Kernel Release:" "$KERNEL"

if echo "$KERNEL" | grep -q "cachyos"; then
    print_info "Kernel Type:" "CachyOS (Optimized)"
else
    print_info "Kernel Type:" "Linux"
fi

print_info "Architecture:" "$(uname -m)"
print_info "Kernel Build:" "$(uname -v)"

echo

# Hardware Information
print_header "Hardware"
print_info "CPU Cores:" "$(nproc)"
print_info "CPU Model:" "$(grep -m 1 'model name' /proc/cpuinfo | cut -d: -f2 | xargs)"
print_info "Total Memory:" "$(free -h | grep ^Mem | awk '{print $2}')"
print_info "Swap Space:" "$(free -h | grep ^Swap | awk '{print $2}')"

echo

# Filesystem Information
print_header "Filesystem"
df -h --output=source,size,used,avail,pcent / | tail -1 | awk '{printf "%-30s %s / %s (%s)\n", "Root Partition:", $3, $2, $5}'
print_info "Total Disk Usage:" "$(du -sh / 2>/dev/null | cut -f1)"

echo

# System Statistics
print_header "System Statistics"
print_info "Installed Packages:" "$(pacman -Qq | wc -l)"
print_info "Uptime:" "$(uptime -p)"
print_info "System Load:" "$(cat /proc/loadavg | awk '{print $1, $2, $3}')"

# Check for updates
UPDATES=$(pacman -Qu 2>/dev/null | wc -l)
if [ "$UPDATES" -gt 0 ]; then
    echo -e "Available Updates:       ${YELLOW}$UPDATES packages${NC}"
else
    echo -e "Available Updates:       ${GREEN}System up to date${NC}"
fi

echo

# Network Information
print_header "Network"
if command -v hostnamectl &> /dev/null; then
    print_info "Hostname:" "$(hostnamectl --static)"
    print_info "Pretty Name:" "$(hostnamectl --pretty)"
fi

# Get primary IP
if command -v ip &> /dev/null; then
    PRIMARY_IP=$(ip route get 1 | awk '{print $(NF-2);exit}' 2>/dev/null || echo "N/A")
    print_info "Primary IP:" "$PRIMARY_IP"
fi

echo

# Display Manager / Desktop Environment
print_header "Desktop Environment"
if [ -n "$DISPLAY" ]; then
    echo -e "Display Server:          ${GREEN}Running${NC}"
    if command -v printenv &> /dev/null; then
        DE=$(printenv XDG_CURRENT_DESKTOP)
        [ -n "$DE" ] && print_info "Desktop Environment:" "$DE"
    fi
else
    echo -e "Display Server:          ${YELLOW}Not running${NC}"
fi

echo
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo -e "${GREEN}BorOS v1.0 - Powered by CachyOS${NC}"
echo -e "${BLUE}═══════════════════════════════════════${NC}"
