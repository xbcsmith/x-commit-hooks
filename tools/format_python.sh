#!/bin/bash

for FILE in $@;do
    filename="$(basename $FILE)"
    if [[ $FILE =~ \.py$ ]];then
        echo "Formatting : ${filename}"
        ruff format "${FILE}"
        ruff check --fix "${FILE}"
    else
        echo "Skipping : ${filename} is NOT a python file"
    fi
done
