#! /usr/bin/env bash

hadolint() {
	docker run --rm -i hadolint/hadolint <"${1}"
}

getDockerfiles() {
	relativePaths="$(find . -name Dockerfile)"
	for path in $relativePaths; do
		readlink -f "${path}"
	done
}

getDirectoriesWithDockerfiles() {
	DOCKERFILES="$(getDockerfiles)"
	for dockerfile in $DOCKERFILES; do
		dirname "$dockerfile"
	done
}

getGitCommitHash() {
	git rev-parse --short HEAD
}

buildDockerfile() {
	contextDir="$1"
	gitCommitHash="$2"

	pwd="$(pwd)"
	relativePath="${contextDir##$pwd\/}"
	imageName="robertsmieja/$(echo $relativePath | awk '{ gsub("/", "-") ; print tolower($0) }')"

	{ 
		docker build $contextDir --tag "${imageName}:latest" --tag "${imageName}:${gitCommitHash}" 
		docker push "${imageName}:latest"
		docker push "${imageName}:${gitCommitHash}"
	} || true
}
