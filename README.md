# fitnessgymreverseproxy — Reverse proxy NGINX (Docker + envsubst)

Edge nginx contenedorizado con la imagen oficial `nginx:stable` y su mecanismo
**envsubst**: la config de prod va embebida en la imagen como valor por defecto,
la de dev se monta como *override* desde el compose, y los valores llegan vía
un `.env` gitignored que gestionás manualmente (cero automatización de
gestores de secretos).

## Requisitos previos

1. **Red externa `fitnessgym-net`**: la crea y gestiona el compose de la app
   (fuera de este repo):

   ```yaml
   # en los composes de la app (responsabilidad del dueño de la app)
   networks:
     default:
       name: fitnessgym-net
   ```

   Si la app todavía no la creó y necesitás levantar el proxy aislado:

   ```bash
   docker network create fitnessgym-net
   ```

2. **App arriba** en esa red (contenedores `fitnessgym_api:5274` y
   `fitnessgym_frontend:5062`) **ANTES que el nginx**: nginx resuelve los
   upstreams al arrancar — si el DNS no responde, el contenedor muere con
   `host not found in upstream "fitnessgym_api"` (y sin app, las rutas
   devolverían 502 de todos modos).
3. **Prod solamente**: certs en `/etc/letsencrypt/live/<GYM_PRIMARY_DOMAIN>/`
   y dhparam en `/etc/nginx/ssl/dhparam.pem` en el host (se montan `:ro`).

## Archivos

| Archivo | Rol |
|---|---|
| `nginx/Dockerfile` | Imagen: `FROM nginx:stable`, defaults prod de las 6 vars `GYM_*`, `NGINX_ENVSUBST_FILTER='^GYM_'`, `NGINX_ENVSUBST_OUTPUT_DIR=/etc/nginx` |
| `nginx/templates/nginx.conf.template` | Template **prod** (por defecto de la imagen) → se renderiza a `/etc/nginx/nginx.conf` |
| `nginx/nginx.local.conf.template` | Template **dev** (HTTP-only) montado `:ro` por el compose local |
| `docker-compose.nginx.yml` | Compose de prod (80/443, certs `:ro`, logs rw) |
| `docker-compose.nginx.local.yml` | Compose de dev (solo 80, valores dev) |
| `.env.example` | Las 6 vars documentadas (sin secretos) |
| `nginx.conf`, `nginx.prod.conf.bak` | **Insumos de solo lectura** — nunca se modifican |

## Variables (set fijo de 6)

| Variable | Default prod (Dockerfile) | Dev |
|---|---|---|
| `GYM_PRIMARY_DOMAIN` | `ahlaradev.website` | `localhost` |
| `GYM_APP_DOMAIN` | `gympower.ahlaradev.website` | `localhost` |
| `GYM_API_UPSTREAM` | `fitnessgym_api:5274` | `fitnessgym_api:5274` |
| `GYM_FRONTEND_UPSTREAM` | `fitnessgym_frontend:5062` | `fitnessgym_frontend:5062` |
| `GYM_SSL_DHPARAM` | `/etc/nginx/ssl/dhparam.pem` | `/etc/nginx/ssl/dhparam.pem` |
| `GYM_CLIENT_MAX_BODY_SIZE` | `100M` | `100M` |

> `NGINX_ENVSUBST_FILTER='^GYM_'` es el ÚNICO guardián de las variables de
> runtime de nginx (`$host`, `$connection_upgrade`, …): al filtrar por prefijo,
> envsubst jamás las expande. NO listar variables manualmente.

## Build de la imagen

```bash
docker compose -f docker-compose.nginx.yml build
# o directamente:
docker build -t fitnessgymnginx ./nginx
```

## Arranque PROD

Crear `.env` desde la plantilla (gitignored), completar los valores a mano y
arrancar normal — los secretos los gestionás vos, nunca este repo:

```bash
cp .env.example .env   # completar valores reales
docker compose -f docker-compose.nginx.yml up -d
```

## Arranque DEV (HTTP, sin certs)

```bash
docker compose -f docker-compose.nginx.local.yml up -d
```

Los valores dev están hardcodeados en ese compose (no son secretos).

## Verificación

```bash
# Ambos composes válidos
docker compose -f docker-compose.nginx.yml config
docker compose -f docker-compose.nginx.local.yml config

# Config renderizada dentro del contenedor (sin literales ${GYM_ sin resolver)
# (dev; en prod usá el nombre fitnessgym-nginx)
docker exec fitnessgym-nginx-local sh -c 'grep -n "\${GYM_" /etc/nginx/nginx.conf || echo OK'
docker exec fitnessgym-nginx-local nginx -t

# Rutas (desde el host; dev = HTTP en :80)
for p in / /api /health /reservacionesHub; do
  printf '%-22s -> %s\n' "$p" "$(curl -s -o /dev/null -w '%{http_code}' "http://localhost$p")"
done
# Esperado: todas non-502 (la app debe estar en fitnessgym-net y arriba)

# Salud del contenedor
docker inspect --format '{{.State.Health.Status}}' fitnessgym-nginx-local
```

## Troubleshooting

| Síntoma | Causa / solución |
|---|---|
| `host not found in upstream "fitnessgym_api"` y el contenedor sale con exit 1 | La app no está arriba en `fitnessgym-net`. Levantar la app primero (Requisitos previos 1–2). |
| `grep '${GYM_' /etc/nginx/nginx.conf` encuentra placeholders y nginx no arranca | Se hizo `docker compose up` **sin** `.env`. El compose lista solo **nombres** `GYM_*`: sin valor en el entorno, compose **elimina** los defaults `ENV` de la imagen y la config queda sin renderizar. Solución: crear `.env` (ver arranque). La imagen sola (`docker run`) sí usa los defaults. |
| `cannot load certificate … Permission denied` en hosts con SELinux | Los bind mounts de certs/dhparam necesitan etiqueta: agregar `:z` (o `:Z`) a los volúmenes de certs en `docker-compose.nginx.yml`, o relabel `restorecon`. En hosts sin SELinux no hace falta nada. |
| `/api` → 404 y `/reservacionesHub` → 400/405 | Respuestas **de la app** a través del proxy (correcto: non-502). 404 = no hay ruta exacta `/api` (es prefijo); 405 vía `HEAD` en el hub = Kestrel respondió. |

## Renew de certs (certbot) — deploy-hook

Tras cada `certbot renew`, recargar nginx **sin downtime**:

```bash
certbot renew --deploy-hook "docker exec fitnessgym-nginx nginx -s reload"
```

o manualmente: `docker exec fitnessgym-nginx nginx -s reload`.

## Política de respaldos (Req. 7)

- ANTES de modificar cualquier archivo existente (compose, Dockerfile,
  config o README) crear respaldo hermano: `<archivo>.bak.<AAAA-MM-DD-HHMMSS>`.
- Los insumos `nginx.conf` y `nginx.prod.conf.bak` **nunca** se sobreescriben
  (solo se copian a los templates).
- Los respaldos están gitignored (`*.bak.*`); ver también `backup/` y `logs/`.

## Higiene de secretos

- `.env` está en `.gitignore`; los composes solo referencian **nombres** `GYM_*`.
- Nunca commitear valores reales: los secretos los gestionás vos, a mano.
