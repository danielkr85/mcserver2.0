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
    curl -OJ https://meta.fabricmc.net/v2/versions/loader/${MC_V}/${FABRIC_LOADER_V}/${FABRIC_INSTALLER_V}/server/jar && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    echo "eula=true" > eula.txt && \
    java -jar /mcserver/fabric-server-mc.1.21.8-loader.0.17.2-launcher.1.1.0.jar --initSettings


# Expose the default Minecraft server port
EXPOSE 25565

# Set the entrypoint to start the Fabric server
ENTRYPOINT ["java", "-Xmx2G", "-Xms2G", "-jar", "/mcserver/fabric-server-mc.1.21.8-loader.0.17.2-launcher.1.1.0.jar", "nogui"]
