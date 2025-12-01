#!/bin/bash
sudo pvcreate /dev/sdb
sudo vgcreate myvg /dev/sdb
sudo lvcreate -n mylv -L 5G myvg
sudo mkfs.ext4 /dev/myvg/mylv
sudo mkdir /mnt/lvmdata
sudo mount /dev/myvg/mylv /mnt/lvmdata
echo "LVM setup completed"
