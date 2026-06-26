# check.ps1 — Verify file structure and content sanity for mini-spectral-theory
# Usage: .\scripts\check.ps1

$ErrorActionPreference = "Continue"

$currentDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$packageDir = Split-Path -Parent $currentDir

Write-Host "=== mini-spectral-theory File Structure Check ===" -ForegroundColor Cyan
Write-Host ""

# Expected file count
$expectedFileCount = 48
$expectedLeanCount = 38

# Count files
$allFiles = Get-ChildItem -Path $packageDir -File -Recurse -Exclude ".git"
$leanFiles = Get-ChildItem -Path $packageDir -Filter "*.lean" -File -Recurse

Write-Host "Total files found: $($allFiles.Count)" -ForegroundColor $(
    if ($allFiles.Count -eq $expectedFileCount) { "Green" } else { "Yellow" }
)
Write-Host "Lean files found: $($leanFiles.Count)" -ForegroundColor $(
    if ($leanFiles.Count -ge $expectedLeanCount) { "Green" } else { "Yellow" }
)

Write-Host ""

# Check key directories exist
$requiredDirs = @(
    "MiniSpectralTheory\Core",
    "MiniSpectralTheory\Morphisms",
    "MiniSpectralTheory\Constructions",
    "MiniSpectralTheory\Properties",
    "MiniSpectralTheory\Theorems",
    "MiniSpectralTheory\Examples",
    "MiniSpectralTheory\Bridges",
    "Test",
    "Benchmark",
    "Computation",
    "docs",
    "scripts"
)

Write-Host "Directory check:" -ForegroundColor Cyan
foreach ($dir in $requiredDirs) {
    $exists = Test-Path (Join-Path $packageDir $dir)
    Write-Host "  $dir : " -NoNewline
    if ($exists) {
        Write-Host "OK" -ForegroundColor Green
    } else {
        Write-Host "MISSING" -ForegroundColor Red
    }
}

Write-Host ""

# Check key source files exist
$requiredFiles = @(
    "lakefile.lean",
    "Main.lean",
    "MiniSpectralTheory.lean",
    "lean-toolchain",
    "MiniSpectralTheory\Core\Basic.lean",
    "MiniSpectralTheory\Core\Laws.lean",
    "MiniSpectralTheory\Core\Objects.lean",
    "MiniSpectralTheory\Theorems\Basic.lean",
    "MiniSpectralTheory\Theorems\Classification.lean",
    "MiniSpectralTheory\Theorems\Main.lean",
    "MiniSpectralTheory\Examples\Standard.lean",
    "MiniSpectralTheory\Examples\Counterexamples.lean",
    "Test\Smoke.lean",
    "Benchmark\CoreCoverage.lean",
    "Computation\Main.lean",
    "docs\Introduction.md",
    "docs\Glossary.md",
    "docs\References.md",
    "scripts\build.ps1",
    "scripts\check.ps1"
)

Write-Host "Key file check:" -ForegroundColor Cyan
foreach ($file in $requiredFiles) {
    $exists = Test-Path (Join-Path $packageDir $file)
    Write-Host "  $file : " -NoNewline
    if ($exists) {
        Write-Host "OK" -ForegroundColor Green
    } else {
        Write-Host "MISSING" -ForegroundColor Red
    }
}

Write-Host ""

# Check each .lean file contains at least one #eval
Write-Host "Checking #eval presence in .lean files:" -ForegroundColor Cyan
$noEvalFiles = @()
foreach ($file in $leanFiles) {
    $content = Get-Content $file.FullName -Raw
    if ($content -notmatch "#eval") {
        $relPath = $file.FullName.Replace($packageDir, "").TrimStart("\")
        $noEvalFiles += $relPath
    }
}

if ($noEvalFiles.Count -eq 0) {
    Write-Host "  All .lean files contain at least one #eval" -ForegroundColor Green
} else {
    Write-Host "  Files missing #eval ($($noEvalFiles.Count)):" -ForegroundColor Yellow
    foreach ($f in $noEvalFiles) {
        Write-Host "    - $f" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "=== Check Complete ===" -ForegroundColor Cyan
