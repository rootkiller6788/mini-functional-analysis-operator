#!/bin/bash
# Clean script for mini-unbounded-operators
# Run: bash scripts/clean.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_DIR"

echo "Cleaning mini-unbounded-operators..."
lake clean
rm -rf build
rm -rf .lake

echo "Clean complete."
