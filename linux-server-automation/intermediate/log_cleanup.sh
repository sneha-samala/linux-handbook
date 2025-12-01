#!/bin/bash
find /var/log -type f -mtime +7 -exec rm -f {} \;
echo "Old logs cleared"
