#!/bin/bash
echo "---CPU Load---"; top -b -n1 | head -5
echo "---Disk Space---"; df -h
echo "---Memory---"; free -h
