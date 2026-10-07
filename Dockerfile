FROM quay.io/keycloak/keycloak:24.0.0

# Inyectamos el diseño guinda de la SETAB
COPY login/ /opt/keycloak/themes/setab_theme/

# Dejamos que Keycloak inicie naturalmente para que sí lea tus contraseñas
CMD ["start-dev"]
