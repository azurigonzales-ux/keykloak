FROM quay.io/keycloak/keycloak:24.0.0

# Inyectamos tu diseño de la SETAB
COPY login/ /opt/keycloak/themes/setab_theme/

# Forzamos TODAS las variables desde la raíz del contenedor
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin
ENV KC_HTTP_HOST=0.0.0.0
ENV KC_PROXY=edge
ENV KC_HOSTNAME_STRICT=false

# Iniciamos en modo desarrollo
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
