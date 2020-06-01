function Build-DockerImage {
    [CmdletBinding()]
    param (
        [string] $ContextDir,
        [string] $CurrentGitCommit
    )
    
    $parentWorkingDir = Get-Location
    $relativePath = $ContextDir.Replace($parentWorkingDir, "")

    # Remove the first character, as it's a '\'
    $imageName = "robertsmieja/" + $relativePath.Remove(0, 1).Replace("\", "-").ToLower()

    Write-Verbose "docker build .${relativePath} --tag ${imageName}:latest --tag ${imageName}:${CurrentGitCommit}"
    docker build ".${relativePath}" --tag ${imageName}:latest --tag ${imageName}:${CurrentGitCommit}
    
    docker push "${imageName}:latest"
    docker push "${imageName}:${CurrentGitCommit}"
}

function Invoke-Hadolint {
    [CmdletBinding()]
    param (
        [string] $Dockerfile
    )
    
    Write-Host "Linting... ${Dockerfile}"
    Get-Content $Dockerfile | docker run --rm -i hadolint/hadolint 
}

function Get-Dockerfiles {
    [CmdletBinding()]
    param ()
    Get-ChildItem -Recurse -Filter Dockerfile
}

function Get-DirectoriesWithDockerfiles {
    [CmdletBinding()]
    param()
    Get-Dockerfiles | ForEach-Object { $_.Directory.ToString() }
}

function Get-CurrentGitCommit {
    [CmdletBinding()]
    param(
        [boolean] $short = $true
    )

    [string[]] $args

    if ($short) {
        $args += "--short"
    }

    git rev-parse "${args}" HEAD
}
