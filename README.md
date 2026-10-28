# fitnessgymreverseproxy — Reverse proxy con NGINX y Docker

Este repositorio corresponde únicamente al reverse proxy del proyecto **fitnessgym**. Su objetivo es llevar el control de versiones del reverse proxy y documentar las decisiones tomadas para el mismo.

Si lo que quieres es levantar la aplicación completa de forma rápida (incluido el reverse proxy), sigue las instrucciones del repositorio principal del proyecto: **https://github.com/aaron-77/gym**

A continuación se detallan las decisiones de configuración y el uso de cada archivo de configuración que compone el reverse proxy.

## Cómo funciona

El reverse proxy se basa en la imagen de NGINX de Docker Hub, publicada con el nombre `aaron77/fitnessgymnginx:latest` (construida a partir de la imagen oficial `nginx:stable`).

La configuración se basa en un único template que se incluye en la imagen. Al iniciar el contenedor, NGINX utiliza `envsubst` para sustituir las variables de configuración por sus valores correspondientes y generar el archivo `/etc/nginx/nginx.conf`.

Las variables propias del proyecto tienen el prefijo `GYM_`. Sus valores predeterminados se definen en el Dockerfile y pueden modificarse mediante `.env` o el Compose correspondiente, según las necesidades del entorno.

Este enfoque evita tener que montar archivos de configuración desde el host o incorporar herramientas adicionales para gestionar secretos.

## Estructura del repositorio

| Archivo                               | Descripción |
| ------------------------------------- | ----------- |
| `nginx/Dockerfile`                    | Define la imagen del reverse proxy, los valores predeterminados de las seis variables `GYM_*` y la configuración de `envsubst`. |
| `nginx/templates/nginx.conf.template` | Contiene el template de nginx que se usa para construir la configuración final de nginx. |
| `docker-compose.installer.dev.yml`    | Define el servicio del reverse proxy y utiliza la imagen publicada en Docker Hub, sin necesidad de construirla localmente. También permite configurar el puerto del host y la red externa. Es el archivo que usa el instalador en ambientes de desarrollo. |
| `docker-compose.local.yml`            | Compose para construir la imagen localmente desde `./nginx` (etiqueta `fitnessgymnginx:latest`); también permite levantar el contenedor con la imagen construida. Usa las mismas variables y valores predeterminados que `docker-compose.installer.dev.yml`. |
| `.env.example`                        | Proporciona una plantilla con las variables de configuración, el puerto del host y el nombre de la red externa. |

## Variables de configuración

El proyecto utiliza seis variables para configurar el comportamiento de NGINX.

| Variable                   | Valor predeterminado         | Propósito |
| -------------------------- | ---------------------------- | --------- |
| `GYM_PRIMARY_DOMAIN`       | `localhost`                  | Dominio principal de la aplicación. |
| `GYM_APP_DOMAIN`           | `localhost`                  | Dominio utilizado para acceder a la aplicación web; pensado para alojar la app en un subdominio. |
| `GYM_API_UPSTREAM`         | `fitnessgym_api:5274`        | Nombre del servicio de la API y puerto interno al que se reenvían las solicitudes. |
| `GYM_FRONTEND_UPSTREAM`    | `fitnessgym_frontend:5062`   | Nombre del servicio del frontend y puerto interno al que se reenvían las solicitudes. |
| `GYM_SSL_DHPARAM`          | `/etc/nginx/ssl/dhparam.pem` | Ruta prevista para el archivo de parámetros Diffie-Hellman cuando se configura HTTPS. Solo relevante para producción; ni el Compose del installer ni el Compose local la definen. |
| `GYM_CLIENT_MAX_BODY_SIZE` | `100M`                       | Tamaño máximo permitido para el cuerpo de una solicitud HTTP. |

Además, `docker-compose.installer.dev.yml` admite las siguientes variables:

| Variable           | Valor predeterminado | Propósito |
| ------------------ | -------------------- | --------- |
| `HOST_HTTP_PORT`   | `80`                 | Puerto del host en el que se publica el servicio HTTP. |
| `EXTERNAL_NETWORK` | `fitnessgym-net`     | Nombre de la red Docker externa a la que se conecta el proxy. |

La red `fitnessgym-net` es creada y administrada por el Compose de la aplicación principal.

### Sustitución de variables con `envsubst`

La imagen utiliza la siguiente configuración:

`NGINX_ENVSUBST_FILTER='^GYM_'`

Este filtro limita la sustitución a las variables cuyo nombre comienza con `GYM_`. Así, `envsubst` no modifica las variables propias de NGINX, como `$host` o `$connection_upgrade`, que deben conservarse para su evaluación durante las solicitudes.

La salida generada se guarda en `/etc/nginx`, mediante la variable `NGINX_ENVSUBST_OUTPUT_DIR`.

## Construcción e inicio

El repositorio incluye dos archivos de Docker Compose:

- `docker-compose.installer.dev.yml` — descarga la imagen publicada en Docker Hub (`aaron77/fitnessgymnginx:latest`) y levanta el contenedor, sin construirla. Es el archivo que consume el instalador en ambientes de desarrollo.
- `docker-compose.local.yml` — construye la imagen localmente desde `./nginx` (etiqueta `fitnessgymnginx:latest`) y levanta el contenedor con esa imagen.

Nota: el archivo `docker-compose.yml` no versiona en este repositorio; es la variante de producción utilizada cuando el host cuenta con certificado SSL y vive únicamente en el servidor.

### Paso 1: crear la red externa (obligatorio en ambos casos)

Antes de cualquier otra acción, crea la red externa en la que correrá el reverse proxy y la aplicación:

```bash
docker network create fitnessgym-net
```

Esta red es la misma que utiliza el Compose de la aplicación principal. Si prefieres otro nombre, crea la red con ese nombre y define la variable `EXTERNAL_NETWORK` en el `.env` (ver paso 2).

### Paso 2: configurar el archivo `.env` (opcional)

Crea el archivo `.env` para personalizar valores (sin él se usan los predeterminados del proyecto). Renombra la plantilla o copia:

```bash
cp .env.example .env
```

Edita el archivo `.env` con los valores de tu entorno. Las variables disponibles son las que se describen en la sección [Variables de configuración](#variables-de-configuración).

### Paso 3a: iniciar el contenedor con la imagen publicada (sin construirla)

```bash
docker compose -f docker-compose.installer.dev.yml up -d
```

Docker descarga `aaron77/fitnessgymnginx:latest` desde Docker Hub y levanta el contenedor.

### Paso 3b: construir la imagen localmente e iniciar el contenedor

Construye la imagen y levanta el contenedor:

```bash
docker compose -f docker-compose.local.yml build
docker compose -f docker-compose.local.yml up -d
```

Docker construye la imagen desde `./nginx` con la etiqueta `fitnessgymnginx:latest` y levanta el contenedor con esa imagen, leyendo los valores del `.env` si existe.

