#! /usr/bin/env sh
. ./common.sh

DOCKERFILES="$(getDockerfiles)"

for dockerfile in $DOCKERFILES; do
	echo "Linting... ${dockerfile}"
	hadolint "${dockerfile}"
done
