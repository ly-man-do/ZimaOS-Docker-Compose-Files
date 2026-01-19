#!/bin/sh

# Plex server details
PLEX_URL="http://192.168.1.222:32400"
PLEX_TOKEN="yourtoken"

# Get the path that changed
CHANGED_PATH="$1"

# Extract section from path (movies or shows)
if [[ "$CHANGED_PATH" == *"movies"* ]]; then
    SECTION="Movies"
elif [[ "$CHANGED_PATH" == *"shows"* ]]; then
    SECTION="TV Shows"
else
    exit 0
fi

# Trigger Plex library scan
curl -s "${PLEX_URL}/library/sections/all/refresh?X-Plex-Token=${PLEX_TOKEN}" > /dev/null

echo "Plex library refreshed for $SECTION"