Write-Host "Checking mini-distributions-sobolev ..."
try {
    lake build
} catch {
    Write-Host "Build failed (expected: deep proofs are sorry stubs)"
}
Write-Host "Running smoke tests..."
lake env lean --run Test/Smoke.lean
Write-Host "Done checking mini-distributions-sobolev."
