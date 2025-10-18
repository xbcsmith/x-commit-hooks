#!/usr/bin/env bash

for FILE in $@;do
    filename="$(basename $FILE)"
    if [[ $FILE =~ \.yaml$ ]] || [[ $FILE =~ \.yml$ ]];then
        echo "Formatting : ${filename}"
        # prettier --write "${FILE}"
        prettier --write --list-different --ignore-unknown ${FILE}
    else
        echo "Skipping : ${filename} is NOT a yaml file"
    fi
done
