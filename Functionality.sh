#!/bin/bash

# Read options
while getopts "vrlui:o:s:" opt; do
  case $opt in
    v) V=1 ;;
    r) R=1 ;;
    l) L=1 ;;
    u) U=1 ;;
    i) INPUT="$OPTARG" ;;
    o) OUTPUT="$OPTARG" ;;
    s)
       S=1
       WORD1="$OPTARG"
       WORD2="${!OPTIND}"
       OPTIND=$((OPTIND+1))
       ;;
  esac
done

# Check required files
if [ -z "$INPUT" ] || [ -z "$OUTPUT" ]; then
  echo "Usage: $0 -i input -o output [options]"
  exit 1
fi

# Start with input file
TEXT=$(cat "$INPUT")

# Swap 
if [ "$V" = "1" ]; then
  TEXT=$(echo "$TEXT" | tr 'a-zA-Z' 'A-Za-z')
fi

# Substitute (case sensitive)
if [ "$S" = "1" ]; then
  TEXT=$(echo "$TEXT" | sed "s/$WORD1/$WORD2/g")
fi

# Reverse
if [ "$R" = "1" ]; then
  TEXT=$(echo "$TEXT" | rev)
fi

#lowercase
if [ "$L" = "1" ]; then
  TEXT=$(echo "$TEXT" | tr 'A-Z' 'a-z')
fi

# uppercase
if [ "$U" = "1" ]; then
  TEXT=$(echo "$TEXT" | tr 'a-z' 'A-Z')
fi

echo "$TEXT" > "$OUTPUT"

echo "Done. Output saved in $OUTPUT"
