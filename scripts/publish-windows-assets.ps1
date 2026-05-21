param(
    [Parameter(Mandatory = $true)]
    [string]$Tag,

    [Parameter(Mandatory = $true)]
    [string]$UserSetupExe,

    [string]$SystemSetupExe,
    [string]$ZipArchive,
    [string]$Notes = "Windows installer assets upload",
    [switch]$Prerelease
)

$ErrorActionPreference = "Stop"

function Require-Command {
    param([string]$Name)
    if (-not (Get-Command $Name -ErrorAction SilentlyContinue)) {
        throw "Required command not found: $Name"
    }
}

Require-Command "gh"

if (-not (Test-Path $UserSetupExe)) {
    throw "User setup EXE not found: $UserSetupExe"
}
if ($SystemSetupExe -and -not (Test-Path $SystemSetupExe)) {
    throw "System setup EXE not found: $SystemSetupExe"
}
if ($ZipArchive -and -not (Test-Path $ZipArchive)) {
    throw "ZIP archive not found: $ZipArchive"
}

$repo = "Kooban64/apzcode-desktop"
$assets = @($UserSetupExe)
if ($SystemSetupExe) { $assets += $SystemSetupExe }
if ($ZipArchive) { $assets += $ZipArchive }

Write-Host "[publish-win] Target release: $Tag" -ForegroundColor Cyan
Write-Host "[publish-win] Assets:" -ForegroundColor Cyan
$assets | ForEach-Object { Write-Host "  $_" }

$releaseExists = $true
try {
    gh release view $Tag --repo $repo | Out-Null
} catch {
    $releaseExists = $false
}

if (-not $releaseExists) {
    Write-Host "[publish-win] Creating release $Tag" -ForegroundColor Cyan
    $args = @("release", "create", $Tag, "--repo", $repo, "--title", "ApzCODE $Tag", "--notes", $Notes)
    if ($Prerelease) { $args += "--prerelease" }
    gh @args | Out-Null
}

Write-Host "[publish-win] Uploading assets..." -ForegroundColor Cyan
$uploadArgs = @("release", "upload", $Tag, "--repo", $repo, "--clobber")
$uploadArgs += $assets
gh @uploadArgs | Out-Null

Write-Host "[publish-win] Done." -ForegroundColor Green
Write-Host "Release URL: https://github.com/$repo/releases/tag/$Tag"
