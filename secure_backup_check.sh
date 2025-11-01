#!/bin/bash
#
# Purpose: Validates input, checks environment prerequisites and conditionally sets up 
# a target directory before simulating a backup operation
#
# 1. Input Validation

if [ $# -ne 2 ]; then
	echo "Error: Two arguments required."
	echo "Usage: $0 <SOURCE_CONFIG_FILE> <TARGET_BACKUP_DIR>"
	exit 1
fi

SOURCE_FILE="$1"
TARGET_DIR="$2"

echo "Starting security and environment check..."
echo "Source File: $SOURCE_FILE"
echo "Target Directory: $TARGET_DIR"

# 2. Source File Check

if [ ! -f "$SOURCE_FILE" ]; then
	echo "Error: Source file '$SOURCE_FILE' does not exist or is not a regular file."
	exit 1
fi
echo "Check 1/3: Source configuration file exists and is accessible."


# 3. Command availability check (exit status)

which tar > /dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "Critical Error: 'tar' command is not installed or not in path. Cannot proceed with backup."
	exit 1
fi
echo "Check 2/3: 'tar' compression utility is available."


# 4. Target Directory Creation (Conditional Logic) ---

if [-d "$TARGET_DIR" ]; then
	echo "Target directory '$TARGET_DIR' already exists. Using existing path."
else
	echo "Target directory '$TARGET_DIR' does not exist. Attempting creation..."
	mkdir -p "$TARGET_DIR"

	if [ $? -ne 0 ]; then
		echo "Error: Failed to create target directory '$TARGET_DIR'."
		exit 1
	fi
	echo "Directory created successfully."

fi

echo "Check 3/3: Target backup directory is ready."


# 5. Simulated action

echo
echo "=========================================="
echo "Success: All environment checks passed."
echo "Simulating backup of '$SOURCE_FILE' to '$TARGET_DIR/$(basename $SOURCE_FILE).tar.gz'..."
# Actual backup command : tar -czf "$TARGET_DIR/backup_$(date +%F).tar.gz" "$SOURCE_FILE"
echo "=========================================="
exit 0

