#!/bin/bash

sudo adduser --disabled-password --gecos "" -q jlake
sudo usermod -a -G admin jlake
sudo mkdir ~jlake/.ssh
sudo bash -c 'curl https://blueskylabs.com/jlake.pub > ~jlake/.ssh/authorized_keys'
sudo chmod 755 ~jlake/.ssh
sudo chmod 755 ~jlake/.ssh/authorized_keys
sudo chown jlake:jlake ~jlake/.ssh
sudo chown jlake:jlake ~jlake/.ssh/authorized_keys
sudo bash -c 'echo "%admin ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/91-admin'
sudo chmod 0440 /etc/sudoers.d/91-admin
