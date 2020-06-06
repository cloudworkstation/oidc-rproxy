# oidc-rproxy
Apache httpd configured as a reverse proxy.  It protects the upstream service using an OIDC provider like Azure AD.

This is packaged as a Docker container and it is available here https://hub.docker.com/r/richardjkendall/oidc-rproxy

## Configuration
The container uses a number of environment variables to pass in configuration.  They are defined below:

|Variable|Purpose|Example|
|---|---|---|
|OIDC_PROVIDER_METADATA_URL|Metadata URL for the OIDC Provider|https://host.domain/.well-known/openid-configuration
|OIDC_PROVIDER_JWKS_URI|URI for the JSON Web Key Set for the OIDC provider|https://host.server/keys
|OIDC_CLIENT_ID|Client ID as configured for this application|n/a
|OIDC_CLIENT_SECRET|Client secret as configured for this application|n/a
|OIDC_CRYPTO_PASSPRHASE|Passphrase used to secure session cookies|n/a
|DOMAIN|Domain where the proxy is deployed|service.domain.com
|PORT|Port on which the proxy is running and exposed|80
|SCHEME|URL scheme used to expose the proxy|https
|UPSTREAM|host and port for the upstream service being projected by the proxy|upstream:port/

