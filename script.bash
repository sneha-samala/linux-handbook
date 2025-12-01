#!/bin/bash
# ======== Variables ========
GROUP_NAME="devteam"
USERS=("dev1" "dev2")
PROJECT_DIR="/opt/project"
# ======== Create Group ========
echo "Creating group: $GROUP_NAME"
groupadd "$GROUP_NAME"
# ======== Create Users & add to group ========
for USER in "${USERS[@]}"; do
  echo "Creating user: $USER"
  useradd -m -s /bin/bash "$USER"
  passwd "$USER"   # Manually enter password when prompted
  usermod -aG "$GROUP_NAME" "$USER"
done
# ======== Project Directory Permissions ========
echo "Setting up project directory permissions"
mkdir -p "$PROJECT_DIR"
chown -R :$GROUP_NAME "$PROJECT_DIR"
chmod -R 770 "$PROJECT_DIR"
# ======== Install Required Packages ========
echo "Updating packages and installing Git, Nginx, Java"
apt update -y
apt install git nginx default-jdk -y
# ======== System Information ========
echo "======== SYSTEM INFO ========"
echo "Hostname: $(hostname)"
echo "CPU:"
lscpu | grep "Model name"
echo "Memory:"
free -h
echo "Disk:"
df -h /
