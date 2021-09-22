#!/bin/bash

RELEASE_REGEXP='^(.*)\s([0-9]+\.[0-9]+\.[0-9]+)$'

function info() {
    echo -ne "[INFO] $*"
}

function error() {
    echo -ne "[ERROR] $*"
}

function die() {
    echo -ne "[FATAL] $*"
    exit 1
}

function usage() {
    cat <<EOF
${0##*/}

> This script aims to automatically create the content of a release note from a Jira Version released.
> This script also gives the possibility to automatically create the PR on centreon-documentation.

Usage: ${0##*/} --version [JIRA VERSION] --jtoken [JIRA TOKEN] --gtoken [GITHUB AUTH TOKEN]
EOF
}

# Function that will trim the double quotes from the string provided.
function remove_dquotes () {
    string=$1
    result="${1%\"}"
    result="${result#\"}"
    echo "$result"
}

function is_commercial_or_open_source_component() {
    component=$(echo "$1" | tr '[:upper:]' '[:lower:]')
    component_snaked="${component// /-}"
    file=""
    if [[ "$component_snaked" =~ (centreon-)?(bam|map|mbi|ppm|lm|license|auto|plugin) ]]; then
        file="centreon-commercial-extensions.md"
    elif [[ "$component_snaked" =~ (centreon-)?(ha|open|dsm) ]]; then
        file="centreon-os-extensions.md"
    elif [[ "$component_snaked" =~ (centreon-)?(web|engine|broker|clib|connector-ssh|connector-perl|gorgone) ]]; then
        file="centreon-core.md"
    else
        die "Failed to find component location in documentation"
    fi
    echo $file
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

while (($# > 0)); do
    case $1 in
        --help|-h)
            usage
            exit
            ;;
        --gtoken)
            GITHUB_AUTH_TOKEN="$2"
            shift
            ;;
        --jtoken)
            JIRA_TOKEN="$2"
            shift
            ;;
        --jversion)
            JIRA_VERSION="$2"
            shift
            ;;
        *)
            usage
            die "Unknown version provided to the script"
    esac
    shift
done

[[ -z $GITHUB_AUTH_TOKEN ]] && die "Missing --gtoken argument."
[[ -z $JIRA_TOKEN ]] && die "Missing --jtoken argument value"
[[ -z $JIRA_VERSION ]] && die "Missing --jversion argument value"

[ -f rn-chunk.md ] && rm rn-chunk.md

# GET version content (releaseDate)
IFS=$'\n' RELEASE=($(curl -s --request GET 'https://centreon.atlassian.net/rest/api/2/project/MON/versions' \
--header 'Authorization: Basic YW1vcmFpc0BjZW50cmVvbi5jb206WnBVSjZ5V055STlrZ1FoQlZsTkUyMTBB==' \
--header 'Content-Type: application/json' | jq ".[] | select(.name == \"$JIRA_VERSION\") | .id, .name, .releaseDate"))

RELEASE_DATE=$(remove_dquotes ${RELEASE[2]})
RELEASE_NAME=$(remove_dquotes ${RELEASE[1]})
RELEASE_COMPONENT=${JIRA_VERSION% *}
RELEASE_VERSION=${JIRA_VERSION##* }

info "Automated release note creation for:\\n\\n"
cat <<EOF
    Jira Version: $JIRA_VERSION
    Component: $RELEASE_COMPONENT
    Version: $RELEASE_VERSION
    Release Date: $RELEASE_DATE

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

cat <<EOF > rn-chunk.md

### $RELEASE_VERSION

Release date: \`$(remove_dquotes $RELEASE_DATE)\`

EOF

if [[ ( ${#FEATURES[@]} > 0 ) ]]; then
    cat <<EOF >> rn-chunk.md
#### Features

${FEATURES[*]}

EOF
fi

if [[ ( ${#IMPROVEMENTS[@]} > 0 ) ]]; then
    cat <<EOF >> rn-chunk.md
#### Improvements

${IMPROVEMENTS[*]}

EOF
fi

if [[ ( ${#BUGS[@]} > 0 ) ]]; then
    cat <<EOF >> rn-chunk.md
#### Bug fixes

${BUGS[*]}

EOF
fi

if [[ ( ${#SECURITY[@]} > 0 ) ]]; then
    cat <<EOF >> rn-chunk.md
#### Security fixes

${SECURITY[*]}

EOF
fi

if [[ ( ${#OTHERS[@]} > 0 ) ]]; then
    cat <<EOF >> rn-chunk.md
#### Others

${OTHERS[*]}
EOF
fi

info "Content automatically generated from Jira\\n"
sed "s/^/    /" rn-chunk.md

file=$(is_commercial_or_open_source_component $RELEASE_COMPONENT)
release_note_file_en="en/releases/$file"
release_note_file_fr="fr/releases/$file"

info "Versions component release note will be added to $release_note_file_en\\n"

gsed -i "/## $RELEASE_COMPONENT/r rn-chunk.md"  $release_note_file_en
gsed -i "/## $RELEASE_COMPONENT/r rn-chunk.md"  $release_note_file_fr

rm rn-chunk.md

info "Changes made to the documentation\\n"
git --no-pager diff

while true; do
    read -p "Do you want to keep those changes ? " yn
    case $yn in
        [Yy]* )
            break
            ;;
        [Nn]* )
            git reset --hard HEAD
            exit
            ;;
        * )
            echo "Please answer yes or no.";;
    esac
done

CREATE=0
while true; do
    read -p "Do you want to create a PR for this ? " yn
    case $yn in
        [Yy]* )
            create_pull_request $VERSION
            break
            ;;
        [Nn]* )
            break
            ;;
        * )
            echo "Please answer yes or no.";;
    esac
done