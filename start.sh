#!/bin/bash

# This file is only for use within the docker container.

set -e
set -u
set -o pipefail

cat /clarify-search-proxy.conf \
  | sed -e "s/CLARIFY_API_KEY/$CLARIFY_API_KEY/" \
  | cat > /etc/nginx/conf.d/default.conf

exec nginx -g "daemon off;"


