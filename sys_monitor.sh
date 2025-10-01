#!/bin/bash

TARGET_USER="Karmanya"

echo "Hello $TARGET_USER! Which service you are looking to monitor today?"

read SERVICE_NAME

# Display the summary message using both the variables

echo "----------------------------------------------------------"
echo "SUMMARY:"
echo "Monitoring Service: $SERVICE_NAME"
echo "Target System User: $TARGET_USER"
echo "----------------------------------------------------------"

# Display System Uptime

echo "System Uptime"
uptime



