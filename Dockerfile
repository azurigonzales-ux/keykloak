FROM quay.io/keycloak/keycloak:24.0.0

# Inyectamos tu diseño de la SETAB
COPY login/ /opt/keycloak/themes/setab_theme/

# Forzamos la creación del usuario maestro desde la raíz
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Iniciamos en modo desarrollo
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
