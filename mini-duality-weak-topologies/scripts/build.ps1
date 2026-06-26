#!/usr/bin/env pwsh
# Build script for mini-duality-weak-topologies
# Run: ./scripts/build.ps1

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot\..

Write-Host "=== Building mini-duality-weak-topologies ==="

# Check if lake is available
$lakeExists = Get-Command lake -ErrorAction SilentlyContinue
if (-not $lakeExists) {
    Write-Host "Error: lake not found. Please ensure Lean 4 is installed."
    exit 1
}

# Update dependencies
Write-Host "Updating dependencies..."
lake update

# Build the package
Write-Host "Building..."
lake build

if ($LASTEXITCODE -eq 0) {
    Write-Host "Build succeeded!"
} else {
    Write-Host "Build failed with exit code $LASTEXITCODE"
    exit $LASTEXITCODE
}
