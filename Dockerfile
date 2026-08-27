FROM eclipse-temurin:21-jre-jammy
WORKDIR /geyser
RUN apt-get update \
    && apt-get install -y --no-install-recommends curl ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && curl -fL -o Geyser.jar "https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone"
EXPOSE 19132/udp
ENTRYPOINT ["java", "-Xms512M", "-jar", "Geyser.jar"]
