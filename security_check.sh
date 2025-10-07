#!/bin/bash

#1. Check if an argument was provided (Argument Check)

if [ "$#" -eq 0 ]; then
	echo "ERROR: Missing file path"
	echo "Usage: $0 <filepath>"
	exit 1

fi

FILE_PATH="$1"

#2. Check if the file exists and is a regular file (Existence Check)

if [ ! -f "$FILE_PATH" ]; then
	echo "ERROR: File not found at $FILE_PATH. Aborting Check"
	exit 2
fi

#3. Check file permissions (High Risk Permissions Check)

# Check if it is both readable or writable, -r,-w.

if [ -r "$FILE_PATH" ] && [ -w "$FILE_PATH" ]; then
	echo "ALERT: File $FILE_PATH is READABLE and WRITABLE by the current user!"
	echo "This is a high-risk configuration for log files or sensitive data."
	exit 3

else
	#4. Fallback/Success Message
	echo "OK: File $FILE_PATH exists and permissions look acceptable for monitoring."
	exit 0
fi


