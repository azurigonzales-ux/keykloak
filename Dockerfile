FROM quay.io/keycloak/keycloak:24.0.0

# Inyectamos tu diseño de la SETAB
COPY setab_theme/ /opt/keycloak/themes/setab_theme/

# Iniciamos en modo desarrollo (usa base de datos interna temporal)
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
