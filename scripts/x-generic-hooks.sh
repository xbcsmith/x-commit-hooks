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
    rev: v4.5.0
    hooks:
      - id: check-merge-conflict
      - id: check-yaml
        args: [--allow-multiple-documents]
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
      - id: commitlint
      - id: markdownlint
      - id: yamllint
      - id: checkyml
      - id: gitcheck

EOF

pre-commit autoupdate
pre-commit run --all-files

rm -rvf .pre-commit-config.yaml
