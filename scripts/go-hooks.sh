#!/usr/bin/env bash

cat > .pre-commit-config.yaml << EOF
---
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v2.3.0
    hooks:
      - id: check-merge-conflict
      - id: check-yaml
      - id: check-json
      - id: check-xml
      - id: check-symlinks
      - id: check-added-large-files
      - id: end-of-file-fixer
      - id: trailing-whitespace
      - id: mixed-line-ending
      - id: detect-private-key
  - repo: https://github.com/xbcsmith/x-commit-hooks
    rev: master
    hooks:
      - id: go-fmt
      - id: go-vet
      - id: golint
      - id: goimports
      - id: gocyclo
        args: [-over=15]
      - id: golangci-lint
      - id: golangci-megalint
      - id: gocritic
      - id: go-unit-tests
      - id: shellcheck
      - id: yamllint
      - id: commitlint
      - id: markdownlint
      - id: shellcheck
      - id: checkyml

EOF

pre-commit autoupdate
pre-commit run --all-files


rm -rvf .pre-commit-config.yaml
