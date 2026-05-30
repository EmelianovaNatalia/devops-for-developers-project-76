#!/bin/bash
MODE=$1
apt-get install -y ufw
ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp

if [ "$MODE" = "app" ]; then
  ufw allow from 192.168.56.13 to any port 80
elif [ "$MODE" = "balancer" ]; then
  ufw allow 80/tcp
  ufw allow 8404/tcp
  ufw allow from 192.168.56.11 to any port 5432
  ufw allow from 192.168.56.12 to any port 5432
fi

ufw --force enable