#!/bin/bash
# Build script for mini-compact-operators

set -e

echo "Building mini-compact-operators..."

cd "$(dirname "$0")/.."

# Run Lake build
lake build

echo "Build complete."
