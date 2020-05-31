#!/usr/bin/env pwsh

Function Invoke-Hadolint {
    param (
        [string] $Dockerfile
    )
    
    Get-Content $Dockerfile | docker run --rm -i hadolint/hadolint 
}

$Dockerfiles = Get-ChildItem -Recurse -Filter Dockerfile

foreach ($Dockerfile in $Dockerfiles) {
    Invoke-Hadolint $Dockerfile
}
