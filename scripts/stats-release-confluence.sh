#!/bin/bash

for file in $(ls *-final.csv); do
   while read -r line; do
      release_date=$(echo $line | cut -d ';' -f1)
      name=$(echo $line | cut -d ';' -f2)
      echo "Creating the page for $name released on $release_date"
   done < $file
done
