#requires -Version 7.0
[CmdletBinding()]
param(
    [string] $SkillsRoot = (Join-Path $env:USERPROFILE '.agents/skills'),
    [switch] $DryRun
)

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$skillSource = Join-Path $repoRoot 'skills/wxpusher-integration'
$skillTarget = [IO.Path]::GetFullPath((Join-Path $SkillsRoot 'wxpusher-integration'))

& python (Join-Path $PSScriptRoot 'check_skill.py') $skillSource
if ($LASTEXITCODE -ne 0) { throw 'Skill validation failed; nothing installed.' }
$sourceFull = [IO.Path]::GetFullPath($skillSource)
if ($skillTarget -eq $sourceFull -or $skillTarget.StartsWith($sourceFull + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
    throw 'Target must not be the source or a directory inside it.'
}

$sourceFiles = @(Get-ChildItem -LiteralPath $skillSource -Recurse -File -Force)
$relativeFiles = @($sourceFiles | ForEach-Object { [IO.Path]::GetRelativePath($skillSource, $_.FullName) })
$changes = 0
if (Test-Path -LiteralPath $skillTarget) {
    $targetItem = Get-Item -LiteralPath $skillTarget -Force
    if (-not $targetItem.PSIsContainer -or ($targetItem.Attributes -band [IO.FileAttributes]::ReparsePoint)) {
        throw 'Target must be a regular directory; inspect existing file/link before installing.'
    }
    foreach ($entry in Get-ChildItem -LiteralPath $skillTarget -Recurse -Force) {
        if ($entry.Attributes -band [IO.FileAttributes]::ReparsePoint) { throw 'Target contains a link; inspect before installing.' }
        if (-not $entry.PSIsContainer -and [IO.Path]::GetRelativePath($skillTarget, $entry.FullName) -notin $relativeFiles) {
            throw 'Target contains files absent from source; inspect them before installing. Nothing removed.'
        }
    }
}
foreach ($file in $sourceFiles) {
    $targetFile = Join-Path $skillTarget ([IO.Path]::GetRelativePath($skillSource, $file.FullName))
    if (Test-Path -LiteralPath $targetFile -PathType Container) { throw 'A target directory conflicts with a source file; inspect before installing.' }
    if (-not (Test-Path -LiteralPath $targetFile -PathType Leaf)) { $changes++; continue }
    if ((Get-FileHash -LiteralPath $file.FullName).Hash -ne (Get-FileHash -LiteralPath $targetFile).Hash) { $changes++ }
}
Write-Output "Source: $skillSource"
Write-Output "Target: $skillTarget"
Write-Output "Changed or new files: $changes"
if ($DryRun -or $changes -eq 0) { return }

if (Test-Path -LiteralPath $skillTarget) {
    $backupBase = Join-Path $env:LOCALAPPDATA 'SkillBackups/wxpusher-integration'
    $backup = Join-Path $backupBase ((Get-Date -Format 'yyyyMMdd-HHmmss') + '-' + [guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Path $backupBase -Force | Out-Null
    Copy-Item -LiteralPath $skillTarget -Destination $backup -Recurse
    Write-Output "Backup: $backup"
}
foreach ($file in $sourceFiles) {
    $targetFile = Join-Path $skillTarget ([IO.Path]::GetRelativePath($skillSource, $file.FullName))
    New-Item -ItemType Directory -Path (Split-Path -Parent $targetFile) -Force | Out-Null
    Copy-Item -LiteralPath $file.FullName -Destination $targetFile -Force
}
foreach ($file in $sourceFiles) {
    $targetFile = Join-Path $skillTarget ([IO.Path]::GetRelativePath($skillSource, $file.FullName))
    if ((Get-FileHash -LiteralPath $file.FullName).Hash -ne (Get-FileHash -LiteralPath $targetFile).Hash) {
        throw 'Installed content differs from source; inspect installation and the backup.'
    }
}
Write-Output 'Installed and verified.'
