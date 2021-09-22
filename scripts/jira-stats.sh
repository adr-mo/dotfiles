#!/bin/bash

REGEXP_REMOVE=".*[0-9]+[0-9]+\.[0-9]+[0-9]+\(.x|.next)|.*999\.999"

function remove_quotes () {
    string=$1
    result="${1%\"}"
    result="${result#\"}"
    echo "$result"
}

function versions_to_keep () {
    local file=$1
    local destination_file=$2
    echo > $destination_file
    echo "Release Date;Version Name;Content" > $destination_file
    while read -r line; do
        release_date=$(echo $line | cut -d ',' -f1)
        name=$(echo $line | cut -d ',' -f2)
        content=$(echo $line | cut -d ',' -f3)

        # Removing versions with no release date
        [[ -z $release_date ]] && continue
        release_date=$(remove_quotes $release_date)
        release_timestamp=$(date -j -f "%Y-%m-%d" ${release_date/\"//g} +%s)

        name=$(remove_quotes "$name")
        content=$(remove_quotes "$content")

        # Removing versions .x
        [[ $name =~ $REGEXP_REMOVE ]] && continue
        echo "$release_date;$name;$content" >> $2
    done < $file
}

curl -s --request GET 'https://centreon.atlassian.net/rest/api/2/project/MON/versions?status=released,archived&orderBy=-releaseDate&maxResults=1000' \
--header 'Authorization: Basic YW1vcmFpc0BjZW50cmVvbi5jb206WnBVSjZ5V055STlrZ1FoQlZsTkUyMTBB==' \
--header 'Content-Type: application/json' | jq -r '.[] | [.releaseDate, .name, ("https://centreon.atlassian.net/projects/MON/versions/" + .id + "/tab/release-report-all-issues")] | @csv' > releases.csv

versions_to_keep "releases.csv" "releases-final.csv"
