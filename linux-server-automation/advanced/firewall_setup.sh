#!/bin/bash
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw enable
echo "Firewall configured: SSH + HTTP allowed"
