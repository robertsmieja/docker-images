#! /bin/env pwsh

Import-Module .\common.psm1

$Dockerfiles = Get-Dockerfiles

foreach ($Dockerfile in $Dockerfiles) {
    Invoke-Hadolint $Dockerfile
}
