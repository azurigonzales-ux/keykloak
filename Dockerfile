FROM quay.io/keycloak/keycloak:24.0.0

# Inyectamos tu diseño de la SETAB (cambiamos setab_theme/ por login/)
COPY login/ /opt/keycloak/themes/setab_theme/

# Iniciamos en modo desarrollo (usa base de datos interna temporal)
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
