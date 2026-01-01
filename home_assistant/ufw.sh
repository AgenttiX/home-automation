#!/usr/bin/env bash
set -e

if [ "${EUID}" -ne 0 ]; then
   echo "This script should be run as root."
   exit 1
fi

ufw allow 8123 comment "Home Assistant"
ufw allow 1883 comment "Home Assistant MQTT"
ufw allow 8883 comment "Home Assistant MQTT TLS"
