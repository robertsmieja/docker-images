#!/usr/bin/env sh

hadolint() {
    docker run --rm -i hadolint/hadolint < "${1}/Dockerfile"
}

for directory in */ ; do
    hadolint "$directory"
done
