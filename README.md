## To start all services in a new ambient

1. clone this repo and add your own ```.env``` using [.env-example](https://github.com/ingsis-group-12/snippet-infrastructure/blob/main/.env-sample) as a template

2. run ```docker compose --profile nginx up -d``` to start only nginx

3. run [./generate_https_certificates.sh](https://github.com/ingsis-group-12/snippet-infrastructure/blob/main/generate_https_certificates.sh) to generate the certificates

4. run ```docker compose --profile nginx down``` to stop the nginx service after the certificates are generated

5. run ```docker compose --profile full-setup up -d``` to start all services with https

## Usage
- run all services: ```docker compose --profile full-setup up```

- stop all services: ```docker compose --profile full-setup down```

- run required services to develop with npm: ```docker compose --profile frontend-development up```

- stop required services to develop with npm: ```docker compose --profile frontend-development down```

## Files explain
[./generate_https_certificates.sh](https://github.com/ingsis-group-12/snippet-infrastructure/blob/main/generate_https_certificates.sh): generate letsencrypt certificates with certbot container

[./renew_https_certificates.sh](https://github.com/ingsis-group-12/snippet-infrastructure/blob/main/renew_https_certificates.sh): renew letsencrypt certificates with certbot container

[./init_nginx](https://github.com/ingsis-group-12/snippet-infrastructure/blob/main/init_nginx.sh): just for the nginx service defined in [docker-compose.yml](https://github.com/ingsis-group-12/snippet-infrastructure/blob/main/docker-compose.yml) to dynamically generate the nginx configuration file depending if the certificates are available or not yet
