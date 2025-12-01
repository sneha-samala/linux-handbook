#!/bin/bash
SOURCE=/opt/devproject
BACKUP=/backup/devproject_$(date +%F).tar.gz
sudo tar -czvf $BACKUP $SOURCE
echo "Backup stored at $BACKUP"
