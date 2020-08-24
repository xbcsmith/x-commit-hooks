#!/bin/bash

isort --atomic --apply --recursive "$@"
black --line-length=120 "$@"
flake8 --max-line-length=120 "$@"
