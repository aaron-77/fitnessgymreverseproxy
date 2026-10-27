FROM nginx:stable

# Defaults: la imagen levanta HTTP out-of-the-box sin env externa.
# Las variables llegan por .env / docker-compose para redefinirlas.
ENV GYM_PRIMARY_DOMAIN=localhost \
    GYM_APP_DOMAIN=localhost \
    GYM_API_UPSTREAM=fitnessgym_api:5274 \
    GYM_FRONTEND_UPSTREAM=fitnessgym_frontend:5062 \
    GYM_SSL_DHPARAM=/etc/nginx/ssl/dhparam.pem \
    GYM_CLIENT_MAX_BODY_SIZE=100M \
    NGINX_ENVSUBST_FILTER='^GYM_' \
    NGINX_ENVSUBST_OUTPUT_DIR=/etc/nginx

COPY templates/nginx.conf.template /etc/nginx/templates/nginx.conf.template
