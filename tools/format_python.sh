#!/bin/bash

isort --atomic --profile black "$@"
black --line-length=120 "$@"
flake8 --max-line-length=120 "$@"
