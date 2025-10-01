#!/bin/bash

# Check if the user provided exactly two arguments"


if [ "$#" -ne 2 ]; then
	echo "ERROR: This script requires exactly two arguments (e.g., ./arg_status.sh file_name target_dir)"
	exit 1 # Exit with a status of 1
fi

# Store arguments in meaningful variables

FILE_NAME="$1"
TARGET_DIR="$2"

echo "Script Name : $0"
echo "First Argument (File): $FILE_NAME"
echo "Second Argument (Directory): $TARGET_DIR"
echo "Total Arguments Received: $#"


# Attempt to create the target directory (Real Command)

mkdir -p "$TARGET_DIR"

# Check the exit status of mkdir command

MKDIR_STATUS="$?"

if [ "$MKDIR_STATUS" -eq 0 ]; then
	echo "Success: Directory '$TARGET_DIR' handled successfully."
else
	echo "Warning: Directory creation/check failed. Status: $MKDIR_STATUS"

fi

echo "Previous Script's Status was: $?"

exit 0


