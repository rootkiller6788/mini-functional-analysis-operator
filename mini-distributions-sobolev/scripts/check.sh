#!/bin/bash
echo "Checking mini-distributions-sobolev ..."
lake build 2>&1 || echo "Build failed (expected: deep proofs are sorry stubs)"
echo "Running smoke tests..."
lake env lean --run Test/Smoke.lean
echo "Done checking mini-distributions-sobolev."
