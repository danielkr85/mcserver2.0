# Use a lightweight base image with Java
FROM openjdk:21-jdk-slim

# Set working directory
WORKDIR /mcserver

# Define argument for Fabric installer URL
ARG MC_V
ARG FABRIC_LOADER_V
ARG FABRIC_INSTALLER_V

# Install dependencies and download Fabric installer and initialize server
RUN apt-get update && apt-get install -y curl && \
    curl -o server.jar https://meta.fabricmc.net/v2/versions/loader/${MC_V}/${FABRIC_LOADER_V}/${FABRIC_INSTALLER_V}/server/jar && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    echo "eula=true" > eula.txt && \
    java -jar server.jar --initSettings

# Copy custom entrypoint script
COPY ./build/entrypoint.sh /mcserver/entrypoint.sh
RUN chmod +x /mcserver/entrypoint.sh

# Expose the default Minecraft server port
EXPOSE 25565

# Set the entrypoint to start the Fabric server
ENTRYPOINT ["./entrypoint.sh"]
