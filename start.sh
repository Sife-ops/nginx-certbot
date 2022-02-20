#!/bin/sh

. ./.env

sed "s/<++>/${CERTBOT_DOMAIN}/" ./nginx-template/default.conf > ./nginx/default.conf

docker-compose -f ./docker-compose.yml up ${1}
