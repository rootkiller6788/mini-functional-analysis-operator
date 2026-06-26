#!/bin/bash
# Test script for mini-compact-operators

set -e

echo "Testing mini-compact-operators..."

cd "$(dirname "$0")/.."

# Run smoke tests
echo "Running smoke tests..."
lake env lean Test/Smoke.lean

# Run example tests
echo "Running example tests..."
lake env lean Test/Examples.lean

# Run regression tests
echo "Running regression tests..."
lake env lean Test/Regression.lean

echo "All tests complete."
