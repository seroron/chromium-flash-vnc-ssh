#!/bin/bash

# supervisor settings
cat /data/supervisord.conf.tmpl | \
    sed -e "s/%SCREEN_WIDTH%/$SCREEN_WIDTH/g" | \
    sed -e "s/%SCREEN_HEIGHT%/$SCREEN_HEIGHT/g" | \
    sed -e "s/%SCREEN_DEPTH%/$SCREEN_DEPTH/g" \
        > /etc/supervisor/conf.d/supervisord.conf

# ssh server settings
mkdir -p /home/vncuser/.ssh/
echo $SSH_PUBKEY | tee -a /home/vncuser/.ssh/authorized_keys
chmod 700 /home/vncuser/.ssh/
chmod 600 /home/vncuser/.ssh/authorized_keys
chown -R vncuser:vncuser /home/vncuser/.ssh 
service ssh start

# lunch supervisord
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

