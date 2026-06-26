Write-Host "Checking mini-bounded-operators ..."
Write-Host "Running lake build..."
Set-Location $PSScriptRoot\..
try {
    lake build 2>&1 | Write-Host
    if ($LASTEXITCODE -eq 0) {
        Write-Host "mini-bounded-operators: BUILD SUCCESS" -ForegroundColor Green
    } else {
        Write-Host "mini-bounded-operators: BUILD FAILED" -ForegroundColor Red
    }
} catch {
    Write-Host "mini-bounded-operators: BUILD ERROR — $_" -ForegroundColor Red
}
