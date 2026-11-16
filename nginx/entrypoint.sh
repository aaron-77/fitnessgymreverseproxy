#!/bin/sh
set -eu

# Las variables pueden sobreescribirse en Compose. Estos valores solo son
# fallbacks cuando el entorno no define una ruta.
CERT="${GYM_SSL_CERT:-/etc/nginx/ssl/fullchain.pem}"
KEY="${GYM_SSL_KEY:-/etc/nginx/ssl/privkey.pem}"
DHPARAM="${GYM_SSL_DHPARAM:-/etc/nginx/ssl/dhparam.pem}"

if [ -f "$CERT" ] && [ -f "$KEY" ] && [ -f "$DHPARAM" ]; then
    echo "Certificado, llave y dhparam encontrados; habilitando HTTPS."
    export GYM_SSL_BLOCK="
        listen 443 ssl;
        listen [::]:443 ssl;
        ssl_certificate $CERT;
        ssl_certificate_key $KEY;
        ssl_dhparam $DHPARAM;
    "
    # Puerto 80 publicado pasa a ser solo cartel: manda todo a HTTPS.
    # El ACME challenge (HTTP-01 webroot) se sirve antes del redirect.
    export GYM_HTTP_REDIRECT_BLOCK='server {
        listen 80;
        listen [::]:80;

        location /.well-known/acme-challenge/ {
            root /var/www/certbot;
        }

        location / {
            return 301 https://$host$request_uri;
        }
    }'
else
    echo "Archivos SSL incompletos o ausentes; iniciando solo con HTTP."
    export GYM_SSL_BLOCK=""
    export GYM_HTTP_REDIRECT_BLOCK=""
fi

# Conserva el procesamiento estándar de templates de la imagen oficial.
exec /docker-entrypoint.sh nginx -g 'daemon off;'
