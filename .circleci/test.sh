#!/bin/bash

set -eu

echo "### go generating"
go generate ./...

if [[ $(git --no-pager diff) ]] ; then
    echo "you need to run go generate"
    git --no-pager diff
    exit 1
fi

echo "### running testsuite"
go test -race ./...

echo "### linting"
gometalinter --vendor ./...
