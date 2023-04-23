#!/bin/sh

doas adduser -D jlake
doas addgroup jlake wheel
doas sed -i 's/jlake:\!/jlake:\*/' /etc/shadow
doas mkdir ~jlake/.ssh
doas wget -q https://blueskylabs.com/jlake.pub -O ~jlake/.ssh/authorized_keys
doas chmod 755 ~jlake/.ssh
doas chmod 644 ~jlake/.ssh/authorized_keys
doas chown jlake:jlake ~jlake/.ssh
doas chown jlake:jlake ~jlake/.ssh/authorized_keys
