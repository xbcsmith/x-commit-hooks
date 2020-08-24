#!/usr/bin/env bash

exec golangci-lint run --deadline=5m --disable-all --enable=vet --enable=gosimple --enable=unused --enable=golint "$@"
