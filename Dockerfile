FROM eclipse-temurin:21-jre-jammy
WORKDIR /geyser
RUN apt-get update \
    && apt-get install -y --no-install-recommends curl ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && curl -fL -o Geyser.jar "https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone"
# Geyser lit/écrit config.yml dans son répertoire de travail courant : on le
# lance depuis /config (monté en volume) plutôt que /geyser (couche image,
# écrasée à chaque build) pour que la config survive aux redéploiements.
WORKDIR /config
EXPOSE 19132/udp
ENTRYPOINT ["java", "-Xms512M", "-jar", "/geyser/Geyser.jar"]
