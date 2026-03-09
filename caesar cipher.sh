#!/bin/bash

while getopts "s:i:o:" opt
do
  case $opt in
    s) SHIFT=$OPTARG ;;
    i) INPUT=$OPTARG ;;
    o) OUTPUT=$OPTARG ;;
  esac
done

UPPER="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
LOWER="abcdefghijklmnopqrstuvwxyz"

SHIFT=$((SHIFT % 26))

S_UPPER="${UPPER:$SHIFT}${UPPER:0:$SHIFT}"
S_LOWER="${LOWER:$SHIFT}${LOWER:0:$SHIFT}"

tr "${UPPER}${LOWER}" "${S_UPPER}${S_LOWER}" < "$INPUT" > "$OUTPUT"

echo "Encryption completed."    
