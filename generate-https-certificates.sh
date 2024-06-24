#!/bin/bash
# run this script to generate lets encrypt certificates only once

# Load the DOMAIN_NAME environment variable from the .env file
if [ -f .env ]; then
  DOMAIN_NAME=$(grep '^DOMAIN_NAME=' .env | cut -d '=' -f2-)
  # Remove surrounding quotes if present
  DOMAIN_NAME=$(echo $DOMAIN_NAME | sed -e 's/^"//' -e 's/"$//')
  DOMAIN_NAME=$(echo $DOMAIN_NAME | sed -e "s/^'//" -e "s/'$//")
fi

# Check if DOMAIN_NAME is set
if [ -z "$DOMAIN_NAME" ]; then
  echo "Error: DOMAIN_NAME is not set in the .env file."
  exit 1
fi

docker compose run --rm certbot certonly --webroot --webroot-path /var/www/certbot/ -d $DOMAIN_NAME
