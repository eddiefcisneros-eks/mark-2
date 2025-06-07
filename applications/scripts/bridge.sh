#!/bin/bash

# Input array
bridge=(7 6 5 8)

# Count occurrences and then count how many occur more than once
duplicates=$(printf "%s\n" "${bridge[@]}" | sort | uniq -c | awk '$1 > 1 { count++ } END { print count+0 }')

echo "$duplicates"