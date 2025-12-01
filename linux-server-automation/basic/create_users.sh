#!/bin/bash
sudo groupadd devteam
for user in dev1 dev2 dev3; do
    sudo useradd -m -G devteam $user
    echo "User $user created and added to devteam"
done
