#!/usr/bin/env bash

script=$(basename "$0")

echo "running ${script}"

if [[ -f ".pre-commit-config.yaml" ]];then
    echo "found .pre-commit-config.yaml ..."
    pre-commit autoupdate
    pre-commit run --all-files
    exit $?
fi

echo "no config found ... creating .pre-commit-config.yaml"

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
      - id: check-executables-have-shebangs
      - id: check-byte-order-marker
      - id: end-of-file-fixer
      - id: trailing-whitespace
      - id: mixed-line-ending
      - id: detect-private-key
      - id: check-ast
      - id: name-tests-test
      - id: requirements-txt-fixer
      - id: double-quote-string-fixer
      - id: fix-encoding-pragma
  - repo: https://github.com/pre-commit/pygrep-hooks
    rev: v1.5.1
    hooks:
      - id: python-use-type-annotations
      - id: python-check-blanket-noqa
      - id: python-check-mock-methods
      - id: python-no-eval
      - id: python-no-log-warn
      - id: python-use-type-annotations
      - id: rst-backticks
      - id: text-unicode-replacement-char
  - repo: https://github.com/xbcsmith/x-commit-hooks
    rev: master
    hooks:
      - id: black
      - id: flake8
      - id: isort
      - id: shellcheck
      - id: commitlint
      - id: markdownlint
      - id: yamllint
      - id: checkyml

EOF

pre-commit autoupdate
pre-commit run --all-files


rm -rvf .pre-commit-config.yaml
