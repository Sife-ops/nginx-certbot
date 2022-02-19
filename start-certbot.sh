#!/bin/sh

if ! touch ./dhparam/dhparam-2048 ; then
    mkdir ./dhparam
    openssl dhparam -out ./dhparam/dhparam-2048.pem 2048
fi

docker-compose -f ./docker-compose-certbot.yml up
