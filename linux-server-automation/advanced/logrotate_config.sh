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
