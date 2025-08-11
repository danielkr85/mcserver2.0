#!/bin/sh

# Entrypoint script for Minecraft server
# Usage: entrypoint.sh <min_memory> <max_memory> <world_dir> [additional_args]

MIN_MEMORY="$1"
MAX_MEMORY="$2"
WORLD_DIR="$3"
shift 3
ADDITIONAL_ARGS="$@"

JAR_FILE="server.jar"

if [ ! -f "$JAR_FILE" ]; then
  echo "Error: $JAR_FILE not found!"
  exit 1
fi

if [ ! -d "$WORLD_DIR" ]; then
  echo "World directory $WORLD_DIR not found. Creating it..."
  mkdir -p "$WORLD_DIR"
fi

exec java -Xms${MIN_MEMORY} -Xmx${MAX_MEMORY} -jar "$JAR_FILE" --world "$WORLD_DIR" $ADDITIONAL_ARGS
