#!/bin/bash

CONTAINER_NAME="CONTAINER_NAME"
CONTAINER_ID="CONTAINER_ID"
SERVER_DDNS="SERVER_DDNS"
DISCORD_BOT_TOKEN="DISCORD_BOT_TOKEN"
DISCORD_CHANNEL_ID="DISCORD_CHANNEL_ID"

if docker ps -q --filter id="$CONTAINER_ID" | grep -q .; then
    echo "Container $CONTAINER_NAME is running."
else

    docker start $CONTAINER_NAME

    sleep 20

    echo "Container started successfully."

    MESSAGE="伺服器已重啟!!"

    DISCORD_API_URL="https://discord.com/api/v10/channels/${DISCORD_CHANNEL_ID}/messages"

    # Send a POST request to the Discord API
    curl -X POST "${DISCORD_API_URL}" \
        -H "Authorization: Bot ${DISCORD_BOT_TOKEN}" \
        -H "Content-Type: application/json" \
        --data '{"content":"'${MESSAGE}'"}'
fi