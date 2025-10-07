#!/bin/bash

# 1. Check if exactly 0 arguments were provided.

if [ "$#"-eq 0 ]; then
        echo "ERROR: Missing port number."
	echo "Usage: $0 <port_number>"
 	exit 2 # exit with status 2(custom error code for missing argument)
fi

# 2. Store the first argument in a variable

PORT="$1"

# 3. Print the intention.

echo "Attempting to configure firewall rule for port: $PORT..."

# 4. Simulate the firewall rule command
# We execute echo which virtually always succeeds (exit status 0)
echo "iptables -A INPUT -p tcp --dport $PORT -j ACCEPT"

# 6. Print the exit status of the previous command ($?)
PLACEHOLDER_STATUS="$?"
echo "Firewall rule command exited with status: $PLACEHOLDER_STATUS"


# End the script successfully
exit 0
