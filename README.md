# Proxmox Cluster Cleanup Scripts

This repository contains two scripts to safely remove a dead Proxmox cluster configuration and restore it if needed.

## Scripts

- `remove-cluster.sh`: Safely removes Proxmox cluster configuration, backing up existing configs.
- `restore-cluster.sh`: Restores cluster configuration from the backup created during cleanup.


## Usage

###  Remove Cluster Configuration (Interactive)

1. **Download the cleanup script to your Proxmox node:**
    ```bash
    curl -O https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/proxmox-cluster-cleanup/main/remove-cluster.sh
    ```

2. **Make the script executable:**
    ```bash
    chmod +x remove-cluster.sh
    ```

3. **Run the script interactively (you will be prompted to confirm):**
    ```bash
    ./remove-cluster.sh
    ```

---

###  Restore Cluster Configuration (Rollback)

If you need to restore your previous cluster configuration:

1. **Download and run the restore script:**
    ```bash
    curl -O https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/proxmox-cluster-cleanup/main/restore-cluster.sh
    chmod +x restore-cluster.sh
    ./restore-cluster.sh
    ```

---

### Optional: Clone Full Repo and Run Locally

If you prefer to clone the entire repository:

```bash
git clone https://github.com/YOUR_GITHUB_USERNAME/proxmox-cluster-cleanup.git
cd proxmox-cluster-cleanup
chmod +x *.sh
./remove-cluster.sh

