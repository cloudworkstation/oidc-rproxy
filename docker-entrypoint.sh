#!/usr/bin/env sh
set -eu

envsubst '${SCHEME} ${PORT} ${UPSTREAM} ${OIDC_CRYPTO_PASSPRHASE} ${DOMAIN} ${OIDC_CLIENT_SECRET} ${OIDC_CLIENT_ID} ${OIDC_PROVIDER_JWKS_URI} ${OIDC_PROVIDER_METADATA_URL}' < /apache.conf > /etc/apache2/sites-available/000-default.conf

exec "$@"
