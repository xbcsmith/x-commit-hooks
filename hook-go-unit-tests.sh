#!/usr/bin/env bash

go test -v -tags=unit -short -timeout 30s ./...

returncode=$?
if [ $returncode -ne 0 ]; then
    echo "unit tests failed"
    exit 1
fi
