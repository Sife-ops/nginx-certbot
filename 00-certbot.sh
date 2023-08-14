#!/bin/sh

. ./env.sh

if ! stat ./dhparam 1>/dev/null 2>&1 ; then
    mkdir ./dhparam
    openssl dhparam -out ./dhparam/dhparam-2048.pem 2048
fi

sed "/server_name/ s/<++>/${CERTBOT_DOMAIN}/" ./nginx-template/default-certbot.conf > ./nginx-certbot/default.conf

docker compose -f ./docker-compose-certbot.yml up $@
