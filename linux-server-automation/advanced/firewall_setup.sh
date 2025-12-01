#!/bin/bash

echo "Applying security hardening..."

# Allow SSH (22)
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow HTTP (80)
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# Allow established connections
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow localhost
sudo iptables -A INPUT -i lo -j ACCEPT

# Drop all other traffic
sudo iptables -P INPUT DROP

# Save rules (Amazon Linux)
sudo service iptables save

echo "Firewall configured using iptables"
