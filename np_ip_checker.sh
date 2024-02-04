# Replace these variables with your No-IP account details
USERNAME="USERNAME"
PASSWORD="PASSWORD"
HOSTNAME="HOSTNAME"

IP_FILE="current_ip.json"

get_current_ip() {
    if [ -f "$IP_FILE" ]; then
        jq -r .ip "$IP_FILE"
    else
        echo "0.0.0.0"
    fi
}

CURRENT_IP=$(curl -s https://api.ipify.org)


LAST_IP=$(get_current_ip)


if [ "$CURRENT_IP" != "$LAST_IP" ]; then

    curl -u "$USERNAME:$PASSWORD" "https://dynupdate.no-ip.com/nic/update?hostname=$HOSTNAME&myip=$CURRENT_IP"

    echo "{\"ip\":\"$CURRENT_IP\"}" > "$IP_FILE"

    echo "IP address updated successfully"
else
    echo "IP address has not changed"
fi