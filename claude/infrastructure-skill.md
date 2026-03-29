# Infrastructure Skill

## Purpose
Provides access to infrastructure and server information for all Claude Code agents.

## When to Use
Use this skill when you need to:
- Connect to servers (Pi, Linode, etc.)
- Check IP addresses (local or Tailscale)
- Reference SSH configurations
- View installed services
- Get server documentation

## Infrastructure Reference

### Quick Access
- **Main Documentation**: `~/Documents/PARA/Areas/Infrastructure/Servers.md`
- **Update Script**: `update-servers` (checks and updates server info)
- **SSH Config**: `~/.ssh/config`

### Active Servers

#### Raspberry Pi
- **Hostname**: `raspberrypi`
- **Local IP**: `192.168.1.50`
- **Tailscale IP**: `100.116.74.35`
- **SSH**: `ssh pi` (Tailscale) or `ssh pi-local` (local network)
- **User**: `pi`
- **SSH Key**: `~/.ssh/id_ed25519`
- **Services**: Tailscale
- **Password**: Stored in iCloud Keychain

#### Linode
- **Tailscale IP**: `100.88.160.126`
- **Hostname**: `localhost-0`
- **Services**: Guacamole, Docker
- *(Details to be added)*

#### Local Devices
- **Mac**: `zacharys-air` - `100.103.116.46`
- **iPhone**: `iphone-15-pro` - `100.80.233.105`

### Common Tasks

**Connect to Pi:**
```bash
ssh pi  # via Tailscale (works from anywhere)
ssh pi-local  # via local network (faster at home)
```

**Check server status:**
```bash
update-servers  # Verify and update infrastructure docs
```

**View full documentation:**
```bash
cat ~/Documents/PARA/Areas/Infrastructure/Servers.md
```

**Check Tailscale network:**
```bash
tailscale status
```

### Security Notes
- All passwords stored in iCloud Keychain
- Server documentation in `~/Documents/PARA/` (permissions: 600)
- Documentation excluded from git via `.gitignore`
- SSH keys used for authentication

### Related Files
- SSH Config: `~/.ssh/config`
- Dotfiles: `~/dotfiles` (GitHub: zackmckenna/dotfiles)
- PARA System: `~/Documents/PARA/`

## Usage Example

When an agent needs to SSH into the Pi:
1. Read this skill to get connection details
2. Use `ssh pi` command
3. Reference `~/Documents/PARA/Areas/Infrastructure/Servers.md` for detailed info

## Maintenance

To keep this skill up to date:
```bash
# Run the update script
update-servers

# Manually edit if needed
code ~/Documents/PARA/Areas/Infrastructure/Servers.md
```

---

**Last Updated**: 2025-11-16
