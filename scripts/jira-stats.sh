#!/bin/bash

TIMESTAMP_AGO="1604016000"
REGEXP_REMOVE=".*[0-9]+[0-9]+\.[0-9]+[0-9]+\(.x|.next)|.*999\.999"
JQL_FILTER="project%20in%20%28BAM%2C%20MON%2C%20MBI%2C%20STUDIO%29%20AND%20issuetype%20in%20%28Bug%2C%20Community%2C%20Escalation%2C%20Story%2C%20Vulnerability%29%20AND%20status%20%3D%20Resolved%20AND%20resolutiondate%20%3E%3D%20%222019-05-01%2000%3A00%22%20ORDER%20BY%20resolved%20ASC%2C%20created%20DESC"

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
    while read -r line; do
        release_date=$(echo $line | cut -d ',' -f1)
        name=$(echo $line | cut -d ',' -f2)
        content=$(echo $line | cut -d ',' -f3)

        # Removing versions with no release date
        [[ -z $release_date ]] && continue
        release_date=$(remove_quotes $release_date)
        release_timestamp=$(date -j -f "%Y-%m-%d" ${release_date/\"//g} +%s)

        # Removing versions too old
        (($release_timestamp >= $TIMESTAMP_AGO)) || continue

        name=$(remove_quotes "$name")
        content=$(remove_quotes "$content")

        # Removing versions .x
        [[ $name =~ $REGEXP_REMOVE ]] && continue
        echo "$release_date;$name;$content" >> $2
    done < $file
}

curl -s --request GET 'https://centreon.atlassian.net/rest/api/2/project/MON/versions?status=released&orderBy=-releaseDate&maxResults=1000' \
--header 'Authorization: Basic YW1vcmFpc0BjZW50cmVvbi5jb206WnBVSjZ5V055STlrZ1FoQlZsTkUyMTBB==' \
--header 'Content-Type: application/json' | jq -r '.[] | [.releaseDate, .name, ("https://centreon.atlassian.net/projects/MON/versions/" + .id + "/tab/release-report-all-issues")] | @csv' > mon-releases.csv

curl -s --request GET 'https://centreon.atlassian.net/rest/api/2/project/BAM/versions?status=released&orderBy=-releaseDate&maxResults=200' \
--header 'Authorization: Basic YW1vcmFpc0BjZW50cmVvbi5jb206WnBVSjZ5V055STlrZ1FoQlZsTkUyMTBB==' \
--header 'Content-Type: application/json' | jq -r '.[] | [.releaseDate, .name, ("https://centreon.atlassian.net/projects/BAM/versions/" + .id + "/tab/release-report-all-issues")] | @csv' > bam-releases.csv

curl -s --request GET 'https://centreon.atlassian.net/rest/api/2/project/MBI/versions?status=released&orderBy=-releaseDate&maxResults=200' \
--header 'Authorization: Basic YW1vcmFpc0BjZW50cmVvbi5jb206WnBVSjZ5V055STlrZ1FoQlZsTkUyMTBB==' \
--header 'Content-Type: application/json' | jq -r '.[] | [.releaseDate, .name, ("https://centreon.atlassian.net/projects/MBI/versions/" + .id + "/tab/release-report-all-issues")] | @csv' > mbi-releases.csv

curl -s --request GET 'https://centreon.atlassian.net/rest/api/2/project/STUDIO/versions?status=released&orderBy=-releaseDate&maxResults=200' \
--header 'Authorization: Basic YW1vcmFpc0BjZW50cmVvbi5jb206WnBVSjZ5V055STlrZ1FoQlZsTkUyMTBB==' \
--header 'Content-Type: application/json' | jq -r '.[] | [.releaseDate, .name, ("https://centreon.atlassian.net/projects/STUDIO/versions/" + .id + "/tab/release-report-all-issues")] | @csv' > studio-releases.csv

versions_to_keep "mon-releases.csv" "releases-mon-final.csv"
versions_to_keep "bam-releases.csv" "releases-bam-final.csv"
versions_to_keep "mbi-releases.csv" "releases-mbi-final.csv"
versions_to_keep "studio-releases.csv" "releases-studio-final.csv"

cat  releases-mon-final.csv releases-bam-final.csv releases-mbi-final.csv releases-studio-final.csv| wc -l
