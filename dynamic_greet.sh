#!/bin/bash

# Script that demonstrates user input and variables.

# Define a fixed variable.
TODAY_DATE=$(date +%F) #Command substitution to get today's date

# Get interactive input from the user.

echo "Hello! What is your favourite OS?"

read FAVOURITE_OS


# Output the results

echo "------------------------------------------------------------------------"
echo "Input Received: $FAVOURITE_OS"
echo "Today's Date is: $TODAY_DATE"
echo "Thank you for the input , goodbye!"















