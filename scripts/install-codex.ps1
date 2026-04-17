param(
    [string[]]$Skill,
    [string]$Destination,
    [switch]$Force,
    [switch]$List,
    [switch]$DryRun
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Get-DefaultDestination {
    if ($env:CODEX_HOME) {
        return Join-Path $env:CODEX_HOME "skills"
    }

    return Join-Path $HOME ".codex\skills"
}

function Get-SkillDirectories {
    param(
        [string]$Root,
        [string[]]$Names
    )

    $available = Get-ChildItem -LiteralPath $Root -Directory | Sort-Object Name
    if (-not $Names -or $Names.Count -eq 0) {
        return $available
    }

    $selected = @()
    foreach ($name in $Names) {
        $match = $available | Where-Object { $_.Name -eq $name }
        if (-not $match) {
            $valid = ($available | Select-Object -ExpandProperty Name) -join ", "
            throw "Unknown skill '$name'. Available skills: $valid"
        }

        $selected += $match
    }

    return $selected
}

function Assert-ChildPath {
    param(
        [string]$Parent,
        [string]$Child
    )

    $parentPath = [System.IO.Path]::GetFullPath($Parent)
    $childPath = [System.IO.Path]::GetFullPath($Child)
    $prefix = $parentPath.TrimEnd([System.IO.Path]::DirectorySeparatorChar) + [System.IO.Path]::DirectorySeparatorChar

    if (-not $childPath.StartsWith($prefix, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Refusing to write outside destination root. Destination root: $parentPath, child: $childPath"
    }
}

$repoRoot = Split-Path -Parent $PSScriptRoot
$skillRoot = Join-Path $repoRoot "skills"
$resolvedDestination = if ($Destination) { $Destination } else { Get-DefaultDestination }

if ($List) {
    Get-ChildItem -LiteralPath $skillRoot -Directory | Sort-Object Name | Select-Object -ExpandProperty Name
    exit 0
}

$skillDirectories = Get-SkillDirectories -Root $skillRoot -Names $Skill

if (-not $DryRun) {
    New-Item -ItemType Directory -Force -Path $resolvedDestination | Out-Null
}

foreach ($directory in $skillDirectories) {
    $target = Join-Path $resolvedDestination $directory.Name
    Assert-ChildPath -Parent $resolvedDestination -Child $target

    if (Test-Path -LiteralPath $target) {
        if ($DryRun) {
            Write-Host ("DRY RUN  {0} would replace {1}" -f $directory.FullName, $target)
            continue
        }

        if (-not $Force) {
            throw "Target already exists: $target. Re-run with -Force to replace it."
        }

        Remove-Item -LiteralPath $target -Recurse -Force
    }

    if ($DryRun) {
        Write-Host ("DRY RUN  {0} -> {1}" -f $directory.FullName, $target)
        continue
    }

    Copy-Item -LiteralPath $directory.FullName -Destination $target -Recurse -Force
    Write-Host ("Installed {0} -> {1}" -f $directory.Name, $target)
}

Write-Host "Restart Codex to pick up newly installed skills."
