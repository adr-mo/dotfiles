#!/bin/bash

VERSION=${VERSION:-"Centreon Web 999.999"}
RELEASE_REGEXP='^(.*)\s([0-9]+\.[0-9]+\.[0-9]+)$'

# Function that will trim the double quotes from the string provided.
function remove_dquotes () {
    string=$1
    result="${1%\"}"
    result="${result#\"}"
    echo "$result"
}

function create_pull_request() {
    set -x
    local version="$1"
    version_snaked="${version//\./-}"
    version_snaked="${version_snaked// /-}"
    branch_name="release-note-$version_snaked"
    title="doc(release): add release note for $version"

    git checkout -b "$branch_name"
    git add -p
    git commit -m "$title"
    git push origin "$branch_name"
    curl -s https://api.github.com/repos/adr-mo/personal-repository/pulls \
        -H "Accept: application/vnd.github.v3+json" \
        -H "Authorization: token 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" \
        -d "{\"head\":\"$branch_name\",\"base\":\"master\", \"title\": \"$title\"}"
}

# GET version content (releaseDate)
IFS=$'\n' RELEASE=($(curl -s --request GET 'https://centreon.atlassian.net/rest/api/2/project/MON/versions' \
--header 'Authorization: Basic YW1vcmFpc0BjZW50cmVvbi5jb206WnBVSjZ5V055STlrZ1FoQlZsTkUyMTBB==' \
--header 'Content-Type: application/json' | jq ".[] | select(.name == \"$VERSION\") | .id, .name, .releaseDate"))

RELEASE_DATE=$(remove_dquotes ${RELEASE[2]})
RELEASE_NAME=$(remove_dquotes ${RELEASE[1]})
RELEASE_COMPONENT=${VERSION% *}
RELEASE_VERSION=${VERSION##* }

echo "Automated release note"
cat <<EOF
Version: $RELEASE_VERSION
Component: $RELEASE_COMPONENT

EOF

# GET version content (releaseDate)
IFS=$'\n' ISSUES=($(curl -s --request POST "https://centreon.atlassian.net/rest/api/2/search" \
    --data '{"jql":"project = MON AND fixVersion ='$(remove_dquotes ${RELEASE[0]})'"}' \
    --header 'Authorization: Basic YW1vcmFpc0BjZW50cmVvbi5jb206WnBVSjZ5V055STlrZ1FoQlZsTkUyMTBB==' \
    --header 'Content-Type: application/json' | jq -c -r '.issues[].fields | [.issuetype.name, (if (.labels | length) > 0 then ("[" + (.labels | join("|")) + "]") else "" end), .summary] | @tsv'))

# Starting the markdown release note
BUGS=()
FEATURES=()
IMPROVEMENTS=()
SECURITY=()
OTHERS=()

for i in "${ISSUES[@]}"; do
    issueType="$(echo $i | cut -d $'\t' -f1)"
    labels=$(echo $i | cut -d $'\t' -f2)
    summary=$(echo $i | cut -d $'\t' -f3)
    if [[ -z $labels ]]; then
        rnline="- $summary"
    else
        rnline="- $labels $summary"
    fi
    case $issueType in
        "Bug")
            BUGS+=($rnline)
            ;;
        "Story")
            FEATURES+=($rnline)
            ;;
        "Vulnerability")
            SECURITY+=($rnline)
            ;;
        "Improvement")
            IMPROVEMENTS+=($rnline)
            ;;
        *)
            OTHERS+=($rnline)
            ;;
    esac
done

cat <<EOF > test.md

### $RELEASE_VERSION

Release date: \`$(remove_dquotes $RELEASE_DATE)\`

EOF

if [[ ( ${#FEATURES[@]} > 0 ) ]]; then
    cat <<EOF >> test.md
#### Features

${FEATURES[*]}

EOF
fi

if [[ ( ${#IMPROVEMENTS[@]} > 0 ) ]]; then
    cat <<EOF >> test.md
#### Improvements

${IMPROVEMENTS[*]}

EOF
fi

if [[ ( ${#BUGS[@]} > 0 ) ]]; then
    cat <<EOF >> test.md
#### Bug fixes

${BUGS[*]}

EOF
fi

if [[ ( ${#SECURITY[@]} > 0 ) ]]; then
    cat <<EOF >> test.md
#### Security fixes

${SECURITY[*]}
EOF
fi

gsed -i "/## Centreon MBI/r test.md" "centreon-commercial-extensions.md" && rm -f test.md

CREATE=0
while true; do
    git diff
    read -p "Do you want to create a PR for this ? " yn
    case $yn in
        [Yy]* )
            create_pull_request $VERSION
            break;;
        [Nn]* )
            git reset --hard HEAD
            exit;;
        * ) echo "Please answer yes or no.";;
    esac
done