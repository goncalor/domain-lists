#!/usr/bin/env bash
# This script is really bad...

OUTFILE='telephone.txt'

urls=$(\
    curl -s 'https://en.wikipedia.org/wiki/List_of_telephone_operating_companies' \
    | grep '\(<td>\|\(<ul>\)\?<li>\)<a href="/wiki/[^"]\+' \
    | grep -o 'href="/wiki/[^"]\+' \
    | grep -v -e List_ -e Category: -e History_ \
    | sed 's/.*href="\([^"]\+\)/https:\/\/en.wikipedia.org\1/' \
    | sort -u\
)

for url in $urls;
do
    echo "$url" >&2
    curl -s "$url" \
        | grep -Po 'Website</th>.*?href="[^"]+' \
        | sed 's/.*href="\([^"]\+\)".*/\1/' \
        | sed 's/.*:\/\/\([^\/]\+\).*/\1/'
done | tee "$OUTFILE"

temp=$(mktemp)
sort -u "$OUTFILE" > "$temp" && mv "$temp" "$OUTFILE"
