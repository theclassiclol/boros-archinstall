# BorOS GitHub Integration Setup Guide

## For Repository Maintainers

This guide explains how to set up the BorOS Archinstall repository on GitHub.

### Step 1: Create GitHub Repository

1. Go to GitHub and create a new repository: `boros-archinstall`
2. Repository settings:
   - **Owner**: theclassiclol
   - **Repository name**: boros-archinstall
   - **Description**: BorOS Custom Archinstall - Distribution installer with CachyOS kernel
   - **Visibility**: Public
   - **License**: GPL-3.0 (or your preferred license)

### Step 2: Initialize Repository

```bash
git clone https://github.com/theclassiclol/boros-archinstall
cd boros-archinstall
```

### Step 3: Push Initial Files

```bash
# Initialize git if needed
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial BorOS Archinstall setup"

# Push to main branch
git push -u origin main
```

### Step 4: One-Command Installation Script

Users can now install BorOS with a single command:

```bash
sudo bash <(curl -fsSL https://github.com/theclassiclol/boros-archinstall/raw/main/install-boros.sh)
```

This downloads the `install-boros.sh` script directly from GitHub and executes it.

### Step 5: GitHub Actions (Optional)

For automated testing and releases, create `.github/workflows/ci.yml`:

```yaml
name: BorOS CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Check shell scripts
        run: bash -n install.sh && bash -n install-boros.sh
      - name: Validate configuration
        run: test -f configs/packages.txt && test -f profiles/minimal/profile.conf
```

### Step 6: Releases and Tags

Create releases on GitHub for version management:

```bash
# Tag a release
git tag -a v1.0 -m "BorOS v1.0 - Initial Release"
git push origin v1.0
```

### Directory Structure for GitHub

```
theclassiclol/boros-archinstall/
├── install.sh
├── install-boros.sh
├── README.md
├── LICENSE
├── .github/
│   └── workflows/
│       └── ci.yml
├── profiles/
│   ├── minimal/
│   │   └── profile.conf
│   └── desktop/
│       └── profile.conf
├── configs/
│   ├── packages.txt
│   ├── locale.conf
│   └── mirrors.conf
└── assets/
    └── logo/
        └── distrologo.png
```

### Repository Settings

1. **Branches**: Protect the `main` branch
2. **Requirements**:
   - Require pull request reviews
   - Dismiss stale PR approvals
   - Require status checks to pass

3. **Collaborators**: Add any co-maintainers

### Usage Documentation

Update README.md with:
- Installation instructions
- Configuration options
- Troubleshooting guide
- Contributing guidelines

### Support Links

In documentation, reference:
- GitHub Issues: Bug reports and feature requests
- GitHub Discussions: Community support
- Releases page: Version history

---

Once set up on GitHub, users can install BorOS anywhere with:

```bash
sudo bash <(curl -fsSL https://github.com/theclassiclol/boros-archinstall/raw/main/install-boros.sh)
```
