#!/bin/bash
# Build script for mini-unbounded-operators
# Run: bash scripts/build.sh [--clean]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_DIR"

if [ "$1" = "--clean" ]; then
  echo "Cleaning build..."
  lake clean
fi

echo "Building mini-unbounded-operators..."
lake build --no-build-deps

echo "Build complete."
