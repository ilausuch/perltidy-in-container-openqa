#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "Usage $0 <file|list of files>"
    exit 1
fi

for filename in "$@"; do
    echo "Checking $filename"
    file="/opt/$filename"
    tidyfile="$file.tdy"

    cd /opt
    perltidy -pro=/.perltidyrc $file

    diff $file $tidyfile
    if [ $? -eq 1 ]; then
        read -r -p 'Do you want to continue with the changes [Y/n]? ' choice
        case "$choice" in
        n|N) exit 0;;
        esac

        rm $file && mv $tidyfile $file
    else
        echo "Is a good one!"
    fi
done