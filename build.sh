#! /usr/bin/env bash

. ./common.sh

# lint first
./lint.sh

DIRECTORIES="$(getDirectoriesWithDockerfiles)"

for directory in $DIRECTORIES; do
	echo "Building in <${directory}> ..."

	gitCommitHash="$(getGitCommitHash)"

	buildDockerfile $directory $gitCommitHash
done
