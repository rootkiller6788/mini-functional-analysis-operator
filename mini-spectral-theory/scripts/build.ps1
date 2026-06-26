# build.ps1 — Build script for mini-spectral-theory
# Usage: .\scripts\build.ps1

$ErrorActionPreference = "Stop"

Write-Host "Building mini-spectral-theory..." -ForegroundColor Cyan

# Check if lake is available
try {
    $lakeVersion = lake --version
    Write-Host "lake version: $lakeVersion" -ForegroundColor Green
} catch {
    Write-Error "lake not found. Install Lean 4 with: https://leanprover.github.io/lean4/doc/quickstart.html"
    exit 1
}

# Build the package
$currentDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$packageDir = Split-Path -Parent $currentDir

Push-Location $packageDir
try {
    lake build
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Build succeeded!" -ForegroundColor Green
    } else {
        Write-Error "Build failed with exit code $LASTEXITCODE"
        exit 1
    }
} finally {
    Pop-Location
}

# Run core tests
Write-Host "Running tests..." -ForegroundColor Cyan
Push-Location $packageDir
try {
    lake env lean --run Test\Smoke.lean
    Write-Host "Tests passed!" -ForegroundColor Green
} finally {
    Pop-Location
}
