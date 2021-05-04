#!/bin/bash


curl -s --location --request GET 'https://api.github.com/repos/centreon/centreon/releases' \
--header 'Content-Type: application/json' | jq '.[] | {Version: .name, Released: .published_at} > github-releases.json