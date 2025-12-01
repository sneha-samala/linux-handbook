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
