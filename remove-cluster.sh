#!/bin/bash

echo "==> Proxmox Cluster Removal Script (SAFE METHOD)"
echo "==> WARNING: This will permanently remove cluster configuration!"
read -p "Are you sure you want to continue? (yes/no): " CONFIRM

if [[ "$CONFIRM" != "yes" ]]; then
  echo "Aborted."
  exit 1
fi

echo "==> Backing up corosync and cluster config..."
mkdir -p /root/pve-cluster-backup
cp -a /etc/corosync /root/pve-cluster-backup/
cp -a /etc/pve/corosync.conf /root/pve-cluster-backup/ 2>/dev/null || true

echo "==> Stopping cluster services..."
systemctl stop pve-cluster corosync

echo "==> Starting pmxcfs in local mode..."
pmxcfs -l &
sleep 3

echo "==> Removing corosync config..."
rm -rf /etc/corosync/*
rm -f /etc/pve/corosync.conf

echo "==> Killing pmxcfs..."
killall pmxcfs
sleep 2

echo "==> Starting pve-cluster service..."
systemctl start pve-cluster

echo "==> Cleaning up HA Manager (if installed)..."
systemctl disable --now pve-ha-lrm pve-ha-crm 2>/dev/null || true

echo "==> Checking cluster status..."
pvecm status || echo "Cluster config removed. Node is now standalone."

echo "==> DONE! Your node is now running in standalone mode."
echo "Backup of old config saved in /root/pve-cluster-backup/"
