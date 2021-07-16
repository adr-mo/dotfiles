#!/bin/bash

function create_release() {
    local name="$1"
    local status="$2"
    local postData="{\"name\": \"$name\", \"description\": \"$name\", \"released\": $released, \"archived\": $released, \"projectId\": 11100}"

    echo "Name: $name | Released: $released"

    curl --location --request POST 'https://centreon.atlassian.net/rest/api/2/version' \
        --header 'Authorization: Basic YW1vcmFpc0BjZW50cmVvbi5jb206WnBVSjZ5V055STlrZ1FoQlZsTkUyMTBB==' \
        --header 'Content-Type: application/json' \
        --header 'Cookie: atlassian.xsrf.token=BGWX-21B5-OH7L-GSQC_5b8bc8ded97073a64eeb16463641c9de10301d8e_lin' \
        --data-raw "$postData"
}

curl -s --request GET "https://centreon.atlassian.net/rest/api/2/project/STUDIO/version?maxResults=200" \
    --header 'Authorization: Basic YW1vcmFpc0BjZW50cmVvbi5jb206WnBVSjZ5V055STlrZ1FoQlZsTkUyMTBB==' \
    --header 'Content-Type: application/json' | jq ".values[] | [.name, .released] | @csv" | tr -d \" | tr -d \\ > releases-map.csv


while IFS=, read -r name released
do
    create_release "$name" "$released"
done < releases-map.csv