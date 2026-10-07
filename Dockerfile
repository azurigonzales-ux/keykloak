# 1. Etapa de construcción
FROM quay.io/keycloak/keycloak:24.0.0 as builder

# Habilitar opciones de salud del servidor
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Indicar que usaremos PostgreSQL (la base de datos de Juan Luis)
ENV KC_DB=postgres

# Compilar una versión optimizada
RUN /opt/keycloak/bin/kc.sh build

# 2. Etapa de producción
FROM quay.io/keycloak/keycloak:24.0.0
COPY --from=builder /opt/keycloak/ /opt/keycloak/

# ==========================================
# AQUI INYECTAMOS TU DISEÑO AL SERVIDOR
# ==========================================
COPY setab_theme/ /opt/keycloak/themes/setab_theme/

# Iniciar el servidor preparado para el proxy de Render
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized", "--proxy-headers=xforwarded"]