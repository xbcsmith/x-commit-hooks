#!/usr/bin/env bash

# Check if ruff configuration exists
if [[ -f "ruff.toml" ]] || grep -q "^\[tool\.ruff" pyproject.toml 2>/dev/null; then
    echo "Found ruff configuration file, using existing config..."
    ruff check .
    ruff format .
else
    echo "No ruff configuration found, using command line options..."
    ruff check --line-length=120 --select=E,F,W,B,I,RUF --ignore=E402,E501,E731 -- --force-wrap-aliases --combine-as-imports .
    ruff format --line-length=120 .
fi
