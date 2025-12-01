#!/bin/bash

SOURCE_DIR="/opt/devproject"
BACKUP_DIR="/backup"
DATE=$(date +%F)
BACKUP_FILE="$BACKUP_DIR/devproject_$DATE.tar.gz"

# Create backup directory if not exists
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

# Create backup
tar -czf "$BACKUP_FILE" "$SOURCE_DIR" 2>/dev/null

# Check if backup succeeded
if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
else
    echo "Backup FAILED!"
fi
