#!/usr/bin/env bash

# Warning this tries to fix code

exec golangci-lint run \
    --fix \
    --no-config \
    --deadline=5m \
    --timeout=30m \
    --disable-all \
    --enable=bodyclose \
    --enable=dogsled \
    --enable=dupl \
    --enable=errcheck \
    --enable=exhaustive \
    --enable=exportloopref \
    --enable=gci \
    --enable=gocognit \
    --enable=goconst \
    --enable=gocritic \
    --enable=gocyclo \
    --enable=gofmt \
    --enable=goimports \
    --enable=goprintffuncname \
    --enable=gosec \
    --enable=govet \
    --enable=ineffassign \
    --enable=misspell \
    --enable=nakedret \
    --enable=noctx \
    --enable=nolintlint \
    --enable=revive \
    --enable=staticcheck \
    --enable=sqlclosecheck \
    --enable=stylecheck \
    --enable=typecheck \
    --enable=unconvert \
    --enable=unparam \
    --enable=whitespace "${@}"
