#!/bin/bash

# Read options
while getopts "o:n:d" opt; do
  case $opt in
    o) OP="$OPTARG" ;;          # Operation
    n) NUMBERS="$OPTARG" ;;     # First number (rest handled later)
    d) DEBUG=1 ;;               # Debug flag
  esac
done

# Shift processed options
shift $((OPTIND - 1))

# Remaining arguments after -n
if [ ! -z "$NUMBERS" ]; then
  ALL_NUMBERS=("$NUMBERS" "$@")
else
  echo ""Usage: $0 -o operation -n num1 num2 [num3 ...] [-d]""
  exit 1
fi

# Check operation
if [[ "$OP" != "+" && "$OP" != "-" && "$OP" != "*" && "$OP" != "%" ]]; then
  echo "Invalid operation. Use + - * %"
  exit 1
fi

# Perform calculation
RESULT=${ALL_NUMBERS[0]}

for ((i=1; i<${#ALL_NUMBERS[@]}; i++))
do
  NUM=${ALL_NUMBERS[$i]}
  case $OP in
    +) RESULT=$((RESULT + NUM)) ;;
    -) RESULT=$((RESULT - NUM)) ;;
    \*) RESULT=$((RESULT * NUM)) ;;
    %) RESULT=$((RESULT % NUM)) ;;
  esac
done

# Print result
echo "Result: $RESULT"

# Debug information
if [ "$DEBUG" = "1" ]; then
  echo "User: $(whoami)"
  echo "Script: $0"
  echo "Operation: $OP"
  echo "Numbers: ${ALL_NUMBERS[*]}"
fi
