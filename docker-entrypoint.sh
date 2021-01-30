#!/usr/bin/env sh
set -eu

# check if remoteuser value is set
OIDC_RU="${OIDC_REMOTE_USER:-email}"
export OIDC_RU=$OIDC_RU
echo "will use $OIDC_RU as source for REMOTE_USER value"

# check if specific requires condition has been given
AUTH_COND="${OIDC_AUTH_COND:-valid-user}"
export AUTH_COND="$AUTH_COND"
echo "will use the following authorisation condition Require $AUTH_COND"

envsubst '${SCHEME} ${PORT} ${UPSTREAM} ${OIDC_CRYPTO_PASSPRHASE} ${DOMAIN} ${OIDC_CLIENT_SECRET} ${OIDC_CLIENT_ID} ${OIDC_PROVIDER_JWKS_URI} ${OIDC_PROVIDER_METADATA_URL} ${OIDC_RU} ${AUTH_COND}' < /apache.conf > /etc/apache2/sites-available/000-default.conf

exec "$@"
