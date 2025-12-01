#!/bin/bash
SERVICES="nginx ssh"
for svc in $SERVICES; do
    sudo systemctl is-active --quiet $svc && \
    echo "$svc is running" || \
    echo "$svc is down"
done
