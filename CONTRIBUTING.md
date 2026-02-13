# BorOS Archinstall - Contributing Guide

Thank you for your interest in contributing to BorOS!

## How to Contribute

### Reporting Bugs

1. **Check existing issues** to avoid duplicates
2. **Create a new issue** with:
   - Clear title describing the problem
   - Steps to reproduce
   - Expected vs actual behavior
   - System information (output of `hostnamectl`)
   - Installation method used

### Suggesting Features

1. **Discuss first** in GitHub Discussions
2. **Create an issue** with:
   - Feature description
   - Use case and motivation
   - Proposed implementation (optional)

### Code Contributions

1. **Fork the repository**
   ```bash
   git clone https://github.com/YOUR-USERNAME/boros-archinstall.git
   cd boros-archinstall
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes**
   - Follow shell script best practices
   - Add comments for complex logic
   - Test thoroughly before submitting

4. **Test your changes**
   - Run shell linting: `shellcheck *.sh`
   - Test installation in a VM
   - Verify all scripts execute without errors

5. **Commit with clear messages**
   ```bash
   git commit -m "Add/Fix: Brief description of changes"
   ```

6. **Push and create a Pull Request**
   ```bash
   git push origin feature/your-feature-name
   ```

## Development Setup

### Testing Environment
```bash
# Create a test directory
mkdir -p ~/boros-test
cd ~/boros-test

# Clone your fork
git clone https://github.com/YOUR-USERNAME/boros-archinstall.git

# Test in a virtual machine using:
# - VirtualBox
# - QEMU
# - VMware Workstation
```

### Code Standards

#### Shell Scripts
- Use `#!/bin/bash` shebang
- Include error checking (`set -e`)
- Use meaningful variable names
- Comment complex sections
- Test with `shellcheck`

#### Configuration Files
- Use clear, commented settings
- Follow existing format
- Document all options

#### Documentation
- Use Markdown formatting
- Include examples
- Keep it clear and concise
- Update when changing features

## Areas for Contribution

### High Priority
- [ ] Desktop environment profiles
- [ ] Hardware auto-detection
- [ ] Multilingual support
- [ ] Security hardening guide
- [ ] Performance optimization

### Medium Priority
- [ ] Additional kernel options
- [ ] Package set customization
- [ ] User interface improvements
- [ ] Better error messages
- [ ] Automated testing

### Low Priority
- [ ] Documentation improvements
- [ ] Typo fixes
- [ ] Logo variations
- [ ] Asset creation
- [ ] Community translations

## Pull Request Process

1. **Format your PR title**: `[Type] Description`
   - Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`
   - Example: `[feat] Add desktop profile for KDE`

2. **Fill the PR template**:
   - Describe changes
   - Link related issues
   - Note any breaking changes

3. **Ensure CI passes**
   - All checks must pass
   - No conflicts with main branch

4. **Address feedback**
   - Respond to review comments
   - Make requested changes
   - Re-request review when ready

5. **Merge**
   - Maintainer will merge when approved
   - Your contribution is credited

## Code Review Guidelines

When reviewing contributions:
- Be respectful and constructive
- Focus on code quality
- Suggest improvements
- Acknowledge good work
- Ask clarifying questions

## Recognition

Contributors are recognized in:
- GitHub Contributors page
- Release notes
- CONTRIBUTORS.md file

## Questions?

- 💬 GitHub Discussions: Ask questions
- 📧 Check profile for contact info
- 📖 Check existing documentation

---

**Thank you for contributing to BorOS!**

*Last Updated: February 2026*
