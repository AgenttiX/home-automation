#!/bin/ash
set -e

# https://github.com/eclipse/mosquitto/issues/2161#issuecomment-1603973779

# Set permissions
user="$(id -u)"
if [ "$user" = '0' ]; then
  mkdir -p "/mosquitto/cert"
  cp "/etc/letsencrypt/live/${CERT_NAME}"/* /mosquitto/cert
  chown mosquitto:mosquitto /mosquitto
  chown -R mosquitto:mosquitto /mosquitto/auth
  chown -R mosquitto:mosquitto /mosquitto/cert
  chown -R mosquitto:mosquitto /mosquitto/data
  chown -R mosquitto:mosquitto /mosquitto/log
fi

exec "$@"
