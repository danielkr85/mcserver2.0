# Use a lightweight base image with Java
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /mcserver

# Define argument for Fabric installer URL
ARG FABRIC_INSTALLER_URL=https://meta.fabricmc.net/v2/versions/loader/1.21.8/0.17.2/1.1.0/server/jar

# Install dependencies and download Fabric installer
RUN apt-get update && apt-get install -y curl && \
    curl -o fabric-installer.jar $FABRIC_INSTALLER_URL && \
    java -jar fabric-installer.jar server -downloadMinecraft && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose the default Minecraft server port
EXPOSE 25565

# Accept the EULA
RUN echo "eula=true" > eula.txt

# Set the entrypoint to start the Fabric server
ENTRYPOINT ["java", "-Xmx2G", "-Xms2G", "-jar", "fabric-server-launch.jar", "nogui"]