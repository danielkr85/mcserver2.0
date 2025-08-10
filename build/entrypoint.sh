#!/bin/sh

# Entrypoint script for Minecraft server
# Usage: entrypoint.sh <min_memory> <max_memory> [additional_args]

MIN_MEMORY="$1"
MAX_MEMORY="$2"
shift 2
ADDITIONAL_ARGS="$@"

JAR_FILE="server.jar"

if [ ! -f "$JAR_FILE" ]; then
  echo "Error: $JAR_FILE not found!"
  exit 1
fi

exec java -Xms${MIN_MEMORY} -Xmx${MAX_MEMORY} -jar "$JAR_FILE" $ADDITIONAL_ARGS
