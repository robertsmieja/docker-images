#!/usr/bin/env sh

hadolint() {
    docker run --rm -i hadolint/hadolint < "${1}"
}

DOCKERFILES=$(find . -iname Dockerfile)

for directory in $DOCKERFILES ; do
    hadolint "$directory"
done
