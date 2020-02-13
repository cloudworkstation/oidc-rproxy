#!/usr/bin/env sh
set -eu

envsubst '${SCHEME} ${PORT} ${UPSTREAM} ${OIDC_CRYPTO_PASSPRHASE} ${DOMAIN} ${OIDC_CLIENT_SECRET} ${OIDC_CLIENT_ID} ${OIDC_PROVIDER_JWKS_URI} ${OIDC_PROVIDER_METADATA_URL}' < /etc/httpd/conf.d/auth.conf.template > /etc/httpd/conf.d/auth.conf

exec "$@"
