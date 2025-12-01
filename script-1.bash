#!/bin/bash
# Root folder name
PROJECT="linux-server-automation"
# Create folder structure
mkdir -p $PROJECT/basic
mkdir -p $PROJECT/intermediate
mkdir -p $PROJECT/advanced
############################################
# BASIC LEVEL SCRIPTS
############################################
cat << 'EOF' > $PROJECT/basic/create_users.sh
#!/bin/bash
sudo groupadd devteam
for user in dev1 dev2 dev3; do
    sudo useradd -m -G devteam $user
    echo "User $user created and added to devteam"
done
EOF
cat << 'EOF' > $PROJECT/basic/set_permissions.sh
#!/bin/bash
sudo mkdir -p /opt/devproject
sudo chown :devteam /opt/devproject
sudo chmod 770 /opt/devproject
echo "Permissions set for /opt/devproject"
EOF
cat << 'EOF' > $PROJECT/basic/install_packages.sh
#!/bin/bash
sudo apt update -y
sudo apt install -y git nginx default-jdk
echo "Git, Nginx & Java installed"
EOF
cat << 'EOF' > $PROJECT/basic/system_info.sh
#!/bin/bash
echo "CPU Info:"; lscpu
echo "Memory Info:"; free -h
echo "Disk Info:"; df -h
EOF
############################################
# INTERMEDIATE LEVEL SCRIPTS
############################################
cat << 'EOF' > $PROJECT/intermediate/automate_backup.sh
#!/bin/bash
SOURCE=/opt/devproject
BACKUP=/backup/devproject_$(date +%F).tar.gz
sudo tar -czvf $BACKUP $SOURCE
echo "Backup stored at $BACKUP"
EOF
cat << 'EOF' > $PROJECT/intermediate/log_cleanup.sh
#!/bin/bash
find /var/log -type f -mtime +7 -exec rm -f {} \;
echo "Old logs cleared"
EOF
cat << 'EOF' > $PROJECT/intermediate/check_service_status.sh
#!/bin/bash
SERVICES="nginx ssh"
for svc in $SERVICES; do
    sudo systemctl is-active --quiet $svc && \
    echo "$svc is running" || \
    echo "$svc is down"
done
EOF
cat << 'EOF' > $PROJECT/intermediate/performance_monitor.sh
#!/bin/bash
echo "---CPU Load---"; top -b -n1 | head -5
echo "---Disk Space---"; df -h
echo "---Memory---"; free -h
EOF
############################################
# ADVANCED LEVEL SCRIPTS
############################################
cat << 'EOF' > $PROJECT/advanced/custom_systemd_service.sh
#!/bin/bash
cat <<EOT | sudo tee /etc/systemd/system/myapp.service
[Unit]
Description=My Custom App Service
[Service]
ExecStart=/usr/bin/python3 /opt/myapp/app.py
Restart=always
[Install]
WantedBy=multi-user.target
EOT
sudo systemctl daemon-reload
sudo systemctl enable myapp
sudo systemctl start myapp
EOF
cat << 'EOF' > $PROJECT/advanced/ssh_hardening.sh
#!/bin/bash
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart sshd
echo "SSH Hardening Applied: Password login disabled"
EOF
cat << 'EOF' > $PROJECT/advanced/lvm_setup.sh
#!/bin/bash
sudo pvcreate /dev/sdb
sudo vgcreate myvg /dev/sdb
sudo lvcreate -n mylv -L 5G myvg
sudo mkfs.ext4 /dev/myvg/mylv
sudo mkdir /mnt/lvmdata
sudo mount /dev/myvg/mylv /mnt/lvmdata
echo "LVM setup completed"
EOF
cat << 'EOF' > $PROJECT/advanced/firewall_setup.sh
#!/bin/bash
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw enable
echo "Firewall configured: SSH + HTTP allowed"
EOF
cat << 'EOF' > $PROJECT/advanced/logrotate_config.sh
#!/bin/bash
cat <<EOT | sudo tee /etc/logrotate.d/myapp
/var/log/myapp.log {
    daily
    rotate 7
    compress
    missingok
    notifempty
}
EOT
echo "Logrotate config added"
EOF
############################################
# PERMISSIONS
############################################
chmod +x $PROJECT/basic/*.sh
chmod +x $PROJECT/intermediate/*.sh
chmod +x $PROJECT/advanced/*.sh
echo "Folder & script setup completed successfully!"
echo "Navigate to $PROJECT directory and run scripts using ./bashfile.sh"
