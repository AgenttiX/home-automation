#!/usr/bin/env bash
set -eu

if [ "${EUID}" -ne 0 ]; then
  echo "This script should be run as root."
  exit 1
fi

# Mosquitto may refuse to start if the permissions are not restrictive enough.
chmod 0700 ./mosquitto/auth/passwd

docker compose up
