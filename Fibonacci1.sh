#!/bin/bash

fib() {
    local n=10
    local a=0
    local b=1

    if (( n == 0 )); then
        echo 0
        return
    elif (( n == 1 )); then
        echo 1
        return
    fi

    for (( i=2; i<=n; i++ )); do
        local temp=$((a + b))
        a=$b
        b=$temp
    done

    echo $b
}

# Example Usage:
result=$(fib 10)
echo "The 10th Fibonacci number is: $result"
