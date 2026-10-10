#!/bin/bash

# Check that both arguments were given
if [ $# -lt 2 ]; then
    echo "Error: two arguments required."
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir="$1"
searchstr="$2"

# Check that filesdir is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a directory."
    exit 1
fi

# X = number of files in the directory and all subdirectories
numfiles=$(find "$filesdir" -type f | wc -l)

# Y = number of lines containing searchstr across those files
nummatches=$(grep -rF -- "$searchstr" "$filesdir" 2>/dev/null | wc -l)

echo "The number of files are $numfiles and the number of matching lines are $nummatches"
