#!/bin/bash

# Check if two arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <old-text> <new-text>"
    exit 1
fi

# Get the old and new text from the arguments
OLD_TEXT="$1"
NEW_TEXT="$2"

# Get the name of the file to modify from the user
FILENAME="$1.manifest.template"

# Check if the file exists
if [ ! -f "$FILENAME" ]; then
    echo "File $FILENAME does not exist"
    exit 1
fi

# Replace the old text with the new text in the file
sed -i "s/$OLD_TEXT/$NEW_TEXT/g" "$FILENAME"
sed -i "s/$OLD_TEXT/$NEW_TEXT/g" "Makefile"

# Rename the file
NEW_FILENAME="$2.manifest.template"
mv "$FILENAME" "$NEW_FILENAME"

echo "File $FILENAME has been modified and renamed to $NEW_FILENAME"

