#!/bin/bash
echo "Checking mini-bounded-operators ..."
echo "Running lake build..."
cd "$(dirname "$0")/.."
if lake build; then
    echo "mini-bounded-operators: BUILD SUCCESS"
else
    echo "mini-bounded-operators: BUILD FAILED"
fi
