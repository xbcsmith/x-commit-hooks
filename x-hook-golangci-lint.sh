#!/usr/bin/env bash

exec golangci-lint run --deadline=5m "$@"
