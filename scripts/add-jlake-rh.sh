#!/bin/bash

adduser jlake
usermod -a -G wheel jlake
mkdir ~jlake/.ssh
curl https://blueskylabs.com/jlake.pub > ~jlake/.ssh/authorized_keys
chmod 755 ~jlake/.ssh
chmod 755 ~jlake/.ssh/authorized_keys
echo "%wheel        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
