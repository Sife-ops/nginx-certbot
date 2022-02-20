#!/bin/sh

. ./.env

if ! readlink -f ./dhparam/dhparam-2048 ; then
    mkdir ./dhparam
    openssl dhparam -out ./dhparam/dhparam-2048.pem 2048
fi

sed "/server_name/ s/<++>/${CERTBOT_DOMAIN}/" ./nginx-template/default-certbot.conf > ./nginx-certbot/default.conf

docker-compose -f ./docker-compose-certbot.yml up ${1}
