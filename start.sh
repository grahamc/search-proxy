#!/bin/bash

cat /etc/nginx/conf.d/default.conf \
  | sed -e "s/CLARIFY_API_KEY/$CLARIFY_API_KEY/" \
  | cat > /etc/nginx/conf.d/config.conf

rm /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"


