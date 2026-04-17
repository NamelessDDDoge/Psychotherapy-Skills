param(
    [string]$Output = "dist\\claude-skills",
    [switch]$Force
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$skillRoot = Join-Path $repoRoot "skills"
$outputRoot = Join-Path $repoRoot $Output
$targetSkills = Join-Path $outputRoot "skills"

if (Test-Path -LiteralPath $outputRoot) {
    if (-not $Force) {
        throw "Output already exists: $outputRoot. Re-run with -Force to replace it."
    }

    Remove-Item -LiteralPath $outputRoot -Recurse -Force
}

New-Item -ItemType Directory -Force -Path $targetSkills | Out-Null

Get-ChildItem -LiteralPath $skillRoot -Directory | ForEach-Object {
    Copy-Item -LiteralPath $_.FullName -Destination (Join-Path $targetSkills $_.Name) -Recurse -Force
}

Write-Host ("Exported Claude skill bundle -> {0}" -f $outputRoot)
