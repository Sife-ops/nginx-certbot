#!/bin/sh

if ! stat ./.env 1>/dev/null 2>&1 ; then
    echo 'Error: no .env file'
    exit 1
fi

. ./.env

sed "s/<++>/${CERTBOT_DOMAIN}/" ./nginx-template/default.conf > ./nginx/default.conf

docker-compose -f ./docker-compose.yml up ${1}
