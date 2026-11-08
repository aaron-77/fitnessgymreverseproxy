# fitnessgymreverseproxy — Reverse proxy con NGINX y Docker

Este repositorio corresponde únicamente al reverse proxy del proyecto **fitnessgym**. Su objetivo es llevar el control de versiones del reverse proxy y documentar las decisiones tomadas para el mismo.

Si lo que quieres es levantar la aplicación completa de forma rápida (incluido el reverse proxy), sigue las instrucciones del repositorio principal del proyecto: **https://github.com/aaron-77/gym**

A continuación se detallan las decisiones de configuración y el uso de cada archivo de configuración que compone el reverse proxy.

## Configuración: una sola imagen para todos los entornos

La misma imagen sirve para desarrollo y producción. Lo que cambia entre entornos son las **variables de entorno** y los **volúmenes** que se montan, no el contenido de la imagen.

### Cómo funciona

1. **Imagen**: se construye desde `nginx/Dockerfile`, usando `nginx:stable` como base. Copia la plantilla y el entrypoint; no copia certificados.
2. **Plantilla**: `nginx/templates/nginx.conf.template` contiene la configuración de NGINX con marcadores `${GYM_*}` (dominios, upstreams, tamaño máximo del body, SSL).
3. **Valores predeterminados**: el `Dockerfile` define cada variable `GYM_*` con un valor por defecto. Se pueden sobrescribir en Compose o en `.env`.
4. **Sustitución al arrancar**: el entrypoint oficial de NGINX procesa la plantilla con `envsubst` y genera `/etc/nginx/nginx.conf`.

El filtro `NGINX_ENVSUBST_FILTER='^GYM_'` limita la sustitución a las variables que empiezan con `GYM_`. Las variables propias de NGINX (`$host`, `$connection_upgrade`, etc.) se conservan para evaluarse en cada solicitud. La salida se guarda en el directorio indicado por `NGINX_ENVSUBST_OUTPUT_DIR` (`/etc/nginx`).

### Ejemplo: SSL opcional

El HTTPS se activa o no según las variables y los archivos disponibles, sin cambiar la imagen:

1. `nginx/entrypoint.sh` toma las rutas de `GYM_SSL_CERT`, `GYM_SSL_KEY` y `GYM_SSL_DHPARAM`. Si alguna no está definida, usa su ruta fallback.
2. Comprueba que los tres archivos existan.
3. Si existen, rellena el bloque HTTPS de la plantilla. Si falta alguno, lo deja vacío y NGINX arranca solo con HTTP.

| Entorno    | Qué se configura                                             | Resultado |
| ---------- | ------------------------------------------------------------ | --------- |
| Desarrollo | Sin montajes de certificados                                 | HTTP      |
| Producción | Se montan los archivos (solo lectura) y se definen sus rutas | HTTPS     |

Los certificados nunca se copian a la imagen: se montan como volúmenes. Las rutas `GYM_SSL_*` son rutas **dentro del contenedor**; las del host se ajustan con `GYM_SSL_CERTS_HOST_PATH` y `GYM_SSL_DHPARAM_HOST_PATH`.

## Estructura del repositorio

| Archivo                               | Descripción |
| ------------------------------------- | ----------- |
| `nginx/Dockerfile`                    | Define la imagen del reverse proxy, los valores predeterminados de `GYM_*`, la configuración de `envsubst` y el entrypoint. |
| `nginx/entrypoint.sh`                 | Comprueba las rutas SSL configuradas y activa el bloque HTTPS solo cuando encuentra certificado, llave y dhparam. |
| `nginx/templates/nginx.conf.template` | Contiene el template común de nginx para desarrollo y producción. |
| `docker-compose.nginx.installer.dev.yml`    | Define el servicio del reverse proxy y utiliza la imagen publicada en Docker Hub, sin necesidad de construirla localmente. También permite configurar el puerto del host y la red externa. Es el archivo que usa el instalador en ambientes de desarrollo. |
| `docker-compose.nginx.local.yml`      | Compose para construir localmente la imagen `fitnessgymnginx` y ejecutarla por HTTP, sin montar certificados. |
| `docker-compose.local.yml`            | Compose alternativo para construir `fitnessgymnginx:latest` y ejecutarla con valores configurables desde `.env`. |
| `.env.example`                        | Proporciona una plantilla con las variables de configuración, el puerto del host y el nombre de la red externa. |

## Variables de configuración

El proyecto utiliza variables `GYM_*` para configurar el comportamiento de NGINX.

| Variable                   | Valor predeterminado | Propósito |
| -------------------------- | -------------------- | --------- |
| `GYM_PRIMARY_DOMAIN`       | `localhost` | Dominio principal de la aplicación. |
| `GYM_APP_DOMAIN`           | `localhost` | Dominio utilizado para acceder a la aplicación web; pensado para alojar la app en un subdominio. |
| `GYM_API_UPSTREAM`         | `fitnessgym_api:5274` | Nombre del servicio de la API y puerto interno al que se reenvían las solicitudes. |
| `GYM_FRONTEND_UPSTREAM`    | `fitnessgym_frontend:5062` | Nombre del servicio del frontend y puerto interno al que se reenvían las solicitudes. |
| `GYM_CLIENT_MAX_BODY_SIZE` | `100M` | Tamaño máximo permitido para el cuerpo de una solicitud HTTP. |

Además, `docker-compose.nginx.installer.dev.yml` admite las siguientes variables:

| Variable           | Valor predeterminado | Propósito |
| ------------------ | -------------------- | --------- |
| `HOST_HTTP_PORT`   | `80`                 | Puerto del host en el que se publica el servicio HTTP. |
| `EXTERNAL_NETWORK` | `fitnessgym-net`     | Nombre de la red Docker externa a la que se conecta el proxy. |

Para el soporte SSL (opcional, solo aplica cuando usas SSL), el Compose de producción admite las siguientes variables:

* **`GYM_SSL_CERT`:** (opcional, solo aplica cuando usas SSL) ruta, dentro del contenedor, del certificado `fullchain.pem`. La lee el entrypoint; si el archivo no existe, NGINX arranca solo con HTTP. Debe empezar con el valor de `GYM_SSL_CERTS_CONTAINER_PATH`.
* **`GYM_SSL_KEY`:** (opcional, solo aplica cuando usas SSL) ruta, dentro del contenedor, de la clave privada `privkey.pem`. Se usa junto con `GYM_SSL_CERT` y también debe empezar con el valor de `GYM_SSL_CERTS_CONTAINER_PATH`.
* **`GYM_SSL_DHPARAM`:** (opcional, solo aplica cuando usas SSL) ruta, dentro del contenedor, del archivo de parámetros Diffie-Hellman (`dhparam.pem`) para TLS.
* **`GYM_SSL_CERTS_HOST_PATH`:** (opcional, solo aplica cuando usas SSL) ruta en el host del directorio de certificados (por defecto `/etc/letsencrypt`). Se monta como volumen de solo lectura en el Compose de producción.
* **`GYM_SSL_CERTS_CONTAINER_PATH`:** (opcional, solo aplica cuando usas SSL) ruta, dentro del contenedor, donde se monta el directorio de certificados del host. Es el valor común de `GYM_SSL_CERT` y `GYM_SSL_KEY`: aunque se usa en partes distintas del proceso (el montaje del volumen y el entrypoint), si la cambias debes actualizar también esas dos variables.
* **`GYM_SSL_DHPARAM_HOST_PATH`:** (opcional, solo aplica cuando usas SSL) ruta en el host del archivo `dhparam.pem`, que se monta en la ruta interna definida por `GYM_SSL_DHPARAM`.

La red `fitnessgym-net` es creada y administrada por el Compose de la aplicación principal.

## Construcción e inicio

El repositorio incluye Compose para desarrollo local, instalación desde una imagen publicada y producción:

- `docker-compose.nginx.installer.dev.yml` — descarga la imagen publicada en Docker Hub (`aaron77/fitnessgymnginx:latest`, variante sin certificados SSL) y levanta el contenedor, sin construirla. Es el archivo que consume el instalador en ambientes de desarrollo.
- `docker-compose.nginx.local.yml` — construye la imagen localmente con la etiqueta `fitnessgymnginx` y levanta el contenedor por HTTP, sin montar certificados.
- `docker-compose.local.yml` — alternativa local que construye la etiqueta `fitnessgymnginx:latest` y permite configurar dominios y upstreams desde `.env`.

Nota: `docker-compose.nginx.yml` contiene la configuración de producción con montajes SSL. Los archivos `docker-compose.nginx.yml` y `docker-compose.nginx.local.yml` están excluidos de Git por `.gitignore` en este repositorio.

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
docker compose -f docker-compose.nginx.installer.dev.yml up -d
```

Docker descarga `aaron77/fitnessgymnginx:latest` desde Docker Hub y levanta el contenedor.

### Paso 3b: construir la imagen localmente e iniciar el contenedor

Construye la imagen y levanta el contenedor:

```bash
docker compose -f docker-compose.local.yml build
docker compose -f docker-compose.local.yml up -d
```

Docker construye la imagen desde `./nginx` con la etiqueta `fitnessgymnginx:latest` y levanta el contenedor con esa imagen, leyendo los valores del `.env` si existe. Para que producción reutilice esta imagen local, ambos Compose deben referirse a la misma etiqueta; `docker-compose.nginx.yml` usa `fitnessgymnginx` (equivalente a `fitnessgymnginx:latest`).
