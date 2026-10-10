#!/bin/bash

# Check that both arguments were given
if [ $# -lt 2 ]; then
    echo "Error: two arguments required."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile="$1"
writestr="$2"

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")"
if [ $? -ne 0 ]; then
    echo "Error: could not create directory for '$writefile'."
    exit 1
fi

# Write the string to the file, overwriting any existing content
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: could not create file '$writefile'."
    exit 1
fi
