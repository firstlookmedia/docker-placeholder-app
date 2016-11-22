#!/bin/bash

set -x

PLACEHOLDER_APPNAME=${PLACEHOLDER_APPNAME:-YAMS}

vars=$( set | grep ^PLACEHOLDER_ )

eval "${vars} envsubst < 503.html.tmpl > /usr/share/nginx/html/503.html"

nginx -g 'daemon off;'
