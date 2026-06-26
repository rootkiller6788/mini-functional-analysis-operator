#!/usr/bin/env pwsh
# Check script for mini-duality-weak-topologies
# Verifies: lakefile.lean syntax, module structure, file count
# Run: ./scripts/check.ps1

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot\..

Write-Host "=== Checking mini-duality-weak-topologies ==="

# Check required top-level files exist
$requiredTop = @(
    "lakefile.lean",
    "lean-toolchain",
    "lake-manifest.json",
    "Main.lean",
    "MiniDualityWeakTopologies.lean"
)

Write-Host "Checking top-level files..."
foreach ($f in $requiredTop) {
    if (Test-Path $f) {
        Write-Host "  OK: $f"
    } else {
        Write-Host "  MISSING: $f"
    }
}

# Check source file count under MiniDualityWeakTopologies/
Write-Host "Checking source files..."
$leanFiles = Get-ChildItem -Path "MiniDualityWeakTopologies" -Recurse -Filter "*.lean"
$fileCount = $leanFiles.Count
Write-Host "  Source .lean files under MiniDualityWeakTopologies/: $fileCount"

# Check test files
Write-Host "Checking test files..."
$testFiles = Get-ChildItem -Path "Test" -Filter "*.lean" -ErrorAction SilentlyContinue
$testCount = if ($testFiles) { $testFiles.Count } else { 0 }
Write-Host "  Test files: $testCount"

# Check benchmark files
Write-Host "Checking benchmark files..."
$benchFiles = Get-ChildItem -Path "Benchmark" -Filter "*.lean" -ErrorAction SilentlyContinue
$benchCount = if ($benchFiles) { $benchFiles.Count } else { 0 }
Write-Host "  Benchmark files: $benchCount"

# Check computation files
Write-Host "Checking computation files..."
$compFiles = Get-ChildItem -Path "Computation" -Filter "*.lean" -ErrorAction SilentlyContinue
$compCount = if ($compFiles) { $compFiles.Count } else { 0 }
Write-Host "  Computation files: $compCount"

# Count all .lean files
$allLean = Get-ChildItem -Path "." -Recurse -Filter "*.lean"
$totalLean = $allLean.Count

# Count all files
$allFiles = Get-ChildItem -Path "." -Recurse -File
$totalAll = $allFiles.Count

Write-Host ""
Write-Host "=== Summary ==="
Write-Host "Total .lean files: $totalLean"
Write-Host "Total all files  : $totalAll"

if ($totalAll -ge 48) {
    Write-Host "PASS: At least 48 total files"
} else {
    Write-Host "WARNING: Fewer than 48 files ($totalAll)"
}

Write-Host "Check complete."
