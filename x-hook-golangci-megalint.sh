#!/usr/bin/env bash

# Warning this tries to fix code

# Check if golangci-lint configuration exists
if [[ -f ".golangci.yaml" ]] || [[ -f ".golangci.yml" ]] || [[ -f "golangci.yaml" ]] || [[ -f "golangci.yml" ]]; then
    echo "Found golangci-lint configuration file, using existing config..."
    exec golangci-lint run \
        --fix \
        --timeout=30m \
        "${@}"
else
    echo "No golangci-lint configuration found, using default linter set..."
    exec golangci-lint run \
        --fix \
        --no-config \
        --timeout=30m \
        --enable-only=bodyclose,dogsled,dupl,errcheck,exhaustive,copyloopvar,goconst,gocritic,gocyclo,gofmt,goimports,goprintffuncname,gosec,govet,ineffassign,misspell,nakedret,noctx,nolintlint,revive,staticcheck,sqlclosecheck,stylecheck,typecheck,unconvert,unparam,whitespace \
        "${@}"
fi
