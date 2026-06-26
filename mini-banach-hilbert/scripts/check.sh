#!/bin/bash
# Smoke check script for mini-banach-hilbert
echo "mini-banach-hilbert check..."
lake build 2>&1 && echo "BUILD OK" || echo "BUILD FAILED"
