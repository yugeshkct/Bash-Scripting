#!/bin/bash

while getopts "o:n:d" opt
do
    case $opt in
        o) OP=$OPTARG ;;
        n) shift $((OPTIND-1)); NUMS=("$@") ;;
        d) DEBUG=true ;;
    esac
done


NUMBERS=("${NUMS[@]}")

RESULT=${NUMBERS[0]}

for ((i=1; i<${#NUMBERS[@]}; i++))
do
    case $OP in
        +) RESULT=$((RESULT + NUMBERS[i])) ;;
        -) RESULT=$((RESULT - NUMBERS[i])) ;;
        \*) RESULT=$((RESULT * NUMBERS[i])) ;;
        %) RESULT=$((RESULT % NUMBERS[i])) ;;
    esac
done
if [ "$DEBUG" = true ]; then
    echo "User: $(whoami)"
    echo "Script: $0"
    echo "Operation: $OP"
    echo "Numbers: ${NUMBERS[@]}"
fi

echo "Result: $RESULT"
