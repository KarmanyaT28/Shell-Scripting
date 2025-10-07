#!/bin/bash
# This script is a simple script using if-else to check if a file exists or an environment variable is set.
#

REQUIRED_FILE=/etc/passwd
ENV_VARIABLE="$1" # Assume user passes an environment type as argument

echo "Starting configuration check..."

# 1. Check for the existence of the required file -f

if [ ! -f "$REQUIRED_FILE" ]; then
	# The ! negates the condition if the file does not exists.
	echo "ERROR: Required file $REQUIRED_FILE does not exist. Aborting."
	exit 1
fi

# 2. Check if the argument (ENV_VARIABLE) is empty -z

if [ -z "$ENV_VARIABLE" ]; then
	echo "Warning: Environment type not provided. Defaulting to 'dev'."
	ENVIRONMENT="dev"

else
	# The environment variable is set, so we use it.
	ENVIRONMENT="$ENV_VARIABLE"
fi

# 3. Check the value of the environment variable (String equality ==)

if [ "$ENVIRONMENT" == "prod" ]; then
	echo "SUCCESS: Production mode selected. File is present. Proceeding with caution."
elif [ "$ENVIRONMENT" == "test" ]; then
	echo "SUCCESS: Test mode selected. File is present. Running diagnostics."
else
	echo "SUCCESS: Dev mode selected. File is present. Running sandbox setup."
fi

exit 0
