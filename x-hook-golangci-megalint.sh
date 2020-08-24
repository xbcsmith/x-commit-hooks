#!/usr/bin/env bash

# Warning this tries to fix code

exec golangci-lint run \
    --fix \
    --no-config \
    --deadline=5m \
    --timeout=30m \
    --disable-all \
    --enable=bodyclose \
    --enable=deadcode \
    --enable=depguard \
    --enable=dogsled \
    --enable=dupl \
    --enable=errcheck \
    --enable=gocognit \
    --enable=goconst \
    --enable=gocritic  \
    --enable=gocyclo \
    --enable=gofmt \
    --enable=goimports \
    --enable=golint \
    --enable=goprintffuncname \
    --enable=gosec \
    --enable=gosimple \
    --enable=govet \
    --enable=ineffassign \
    --enable=maligned \
    --enable=megacheck \
    --enable=misspell \
    --enable=nakedret \
    --enable=prealloc \
    --enable=rowserrcheck \
    --enable=staticcheck \
    --enable=structcheck \
    --enable=stylecheck \
    --enable=typecheck \
    --enable=unconvert \
    --enable=unparam \
    --enable=unused \
    --enable=varcheck \
    --enable=whitespace "${@}"
