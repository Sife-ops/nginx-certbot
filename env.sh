#!/bin/sh

if stat ./.env 1>/dev/null 2>&1 ; then . ./.env ; fi

err() {
    echo 'Error: environment variables'
}

if [ -z $CERTBOT_EMAIL ] ; then err ; exit 1 ; fi
if [ -z $CERTBOT_DOMAIN ] ; then err ; exit 1 ; fi

