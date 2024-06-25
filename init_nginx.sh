#!/bin/bash

# Paths to the certificate files
CERT_FILE="/etc/nginx/ssl/live/${DOMAIN_NAME}/fullchain.pem"
KEY_FILE="/etc/nginx/ssl/live/${DOMAIN_NAME}/privkey.pem"

# Paths to the NGINX config templates
NON_SECURED_CONF="/etc/nginx/conf.d/default.conf.not-secured.template"
SECURED_CONF="/etc/nginx/conf.d/default.conf.template"
TARGET_CONF="/etc/nginx/conf.d/default.conf"

# Check if both certificate files exist
if [[ -f "$CERT_FILE" && -f "$KEY_FILE" ]]; then
  echo "SSL certificates found. Using secured NGINX configuration."
  envsubst '$${DOMAIN_NAME}' < "$SECURED_CONF" > "$TARGET_CONF"
else
  echo "SSL certificates not found. Using non-secured NGINX configuration."
  envsubst '$${DOMAIN_NAME}' < "$NON_SECURED_CONF" > "$TARGET_CONF"
fi

# Start NGINX
nginx -g 'daemon off;'
