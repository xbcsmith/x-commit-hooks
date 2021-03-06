#!/usr/bin/env bash

go get -u -v github.com/go-delve/delve/cmd/dlv
go get -u -v golang.org/x/tools/...
go get -u -v golang.org/x/tools/gopls@latest
go get -u -v golang.org/x/lint/golint
go get -u -v github.com/fzipp/gocyclo
go get -u -v github.com/uudashr/gocognit/cmd/gocognit
go get -u -v github.com/go-critic/go-critic/cmd/gocritic
go get -u -v github.com/golangci/golangci-lint/cmd/golangci-lint
