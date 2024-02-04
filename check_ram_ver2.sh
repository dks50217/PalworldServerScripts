#!/bin/bash
RCON_PORT="RCON_PORT"
ADMIN_PASSWORD="ADMIN_PASSWORD"
THRESHOLD="THRESHOLD"

MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

if (( $(echo "$MEMORY_USAGE > $THRESHOLD" | bc -l) )); then
    echo "Memory usage is above $THRESHOLD%. Running clean command."
    echo "broadcast Memory_Is_Above_$THRESHOLD%" | ./rcon -a 127.0.0.1:$RCON_PORT -p $ADMIN_PASSWORD
    echo "save" | ./rcon -a 127.0.0.1:$RCON_PORT -p $ADMIN_PASSWORD
    echo "shutdown 300 Server_is_going_to_reboot_in_5_minutes" | ./rcon -a 127.0.0.1:$RCON_PORT -p $ADMIN_PASSWORD
    /backupmanager.sh
    sleep 120
    echo 'broadcast Server_is_going_to_reboot_in_3_minutes' | ./rcon -a 127.0.0.1:$RCON_PORT -p $ADMIN_PASSWORD
    sleep 60
    echo 'broadcast Server_is_going_to_reboot_in_2_minutes' | ./rcon -a 127.0.0.1:$RCON_PORT -p $ADMIN_PASSWORD
    sleep 60
    echo 'broadcast Server_is_going_to_reboot_in_60_seconds' | ./rcon -a 127.0.0.1:$RCON_PORT -p $ADMIN_PASSWORD
    sleep 50
    echo 'broadcast Server_is_going_to_reboot_in_10_seconds' | ./rcon -a 127.0.0.1:$RCON_PORT -p $ADMIN_PASSWORD
    sleep 5
    echo 'broadcast Server_is_going_to_reboot_in_5_seconds' | ./rcon -a 127.0.0.1:$RCON_PORT -p $ADMIN_PASSWORD
    sleep 1
    echo 'broadcast Server_is_going_to_reboot_in_4_seconds' | ./rcon -a 127.0.0.1:$RCON_PORT -p $ADMIN_PASSWORD
    sleep 1
    echo 'broadcast Server_is_going_to_reboot_in_3_seconds' | ./rcon -a 127.0.0.1:$RCON_PORT -p $ADMIN_PASSWORD
    sleep 1
    echo 'broadcast Server_is_going_to_reboot_in_2_seconds' | ./rcon -a 127.0.0.1:$RCON_PORT -p $ADMIN_PASSWORD
    sleep 1
    echo 'broadcast Server_is_going_to_reboot_in_1_second' | ./rcon -a 127.0.0.1:$RCON_PORT -p $ADMIN_PASSWORD
    sleep 15
else
    echo "broadcast Memory_usage_is_$MEMORY_USAGE%. No action required." | ./rcon -a 127.0.0.1:$RCON_PORT -p $ADMIN_PASSWORD
fi