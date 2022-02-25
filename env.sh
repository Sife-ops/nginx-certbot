#!/bin/sh

if stat ./.env 1>/dev/null 2>&1 ; then . ./.env ; fi

if [ -z $CERTBOT_EMAIL ] ; then fail=1 ; fi
if [ -z $CERTBOT_DOMAIN ] ; then fail=1 ; fi

if [ -n $fail ] ; then 
    echo 'Error: environment variables'
    exit 1 
fi

