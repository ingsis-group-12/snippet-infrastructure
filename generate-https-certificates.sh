#!/bin/bash
# run this script to generate lets encrypt certificates only once

# Load environment variables from the .env file
if [ -f .env ]; then
  export $(cat .env | xargs)
fi

# Check if DOMAIN_NAME is set
if [ -z "$DOMAIN_NAME" ]; then
  echo "Error: DOMAIN_NAME is not set in the .env file."
  exit 1
fi

docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ -d $DOMAIN_NAME
