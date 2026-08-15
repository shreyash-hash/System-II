#!/bin/bash

> description.txt

find "$1" -name "*.c" | while read file
do
    echo "==============================================================" >> description.txt 
    echo "FILE: $file" >> description.txt
    echo "==============================================================" >> description.txt
    awk -f extract.awk "$file" >> description.txt
    echo "" >> description.txt
done

echo "Done."
