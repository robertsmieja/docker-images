#!/usr/bin/env sh

hadolint() {
    docker run --rm -i hadolint/hadolint < "${1}"
}

DOCKERFILES="$(find . -name Dockerfile)"

for dockerfile in $DOCKERFILES ; do
    echo "Linting... ${dockerfile}"
    hadolint "${dockerfile}"
done
