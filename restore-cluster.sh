#!/bin/bash

echo "==> Restoring Proxmox Cluster Configuration..."
if [ ! -d /root/pve-cluster-backup ]; then
  echo "Backup not found. Cannot restore."
  exit 1
fi

systemctl stop pve-cluster corosync

echo "==> Restoring backup..."
cp -a /root/pve-cluster-backup/corosync /etc/
cp -a /root/pve-cluster-backup/corosync.conf /etc/pve/ 2>/dev/null || true

systemctl start pve-cluster corosync
echo "==> Cluster configuration restored!"
pvecm status
