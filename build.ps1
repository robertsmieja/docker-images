#! /bin/env pwsh

Import-Module .\common.psm1

# lint first
.\lint.ps1

$directories = Get-DirectoriesWithDockerfiles

foreach ($directory in $directories) {
    Write-Host "Building in <${directory}> ..."

    $gitCommitHash = Get-CurrentGitCommit

    Build-DockerImage $directory $gitCommitHash
}
