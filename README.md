# Proxmox Cluster Cleanup Scripts

This repository contains two scripts to safely remove a dead Proxmox cluster configuration and restore it if needed.

## Scripts

- `remove-cluster.sh`: Safely removes Proxmox cluster configuration, backing up existing configs.
- `restore-cluster.sh`: Restores cluster configuration from the backup created during cleanup.

## Usage

### Remove Cluster Config

```bash
curl -s https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/proxmox-cluster-cleanup/main/remove-cluster.sh | bash
```

### Restore Cluster Config (Rollback)

```bash
bash restore-cluster.sh
```
