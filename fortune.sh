#!/usr/bin/env bash

# to update this link, go to Fortune 500 list and check requests that load the info about companies
curl -v -O franchises.json 'https://content.fortune.com/wp-json/irving/v1/data/franchise-search-results?list_id=2814606'

grep -Po '"permalink":"[^"]+"' franchises.json | sort -u | cut -d: -f2- | tr -d '"\\' | tee permalinks.txt

while read perma; do
    curl -s $perma;
done < permalinks.txt \
    | grep --line-buffered -Po '"website":"[^"]+"' \
    | tee /dev/tty | uniq | cut -d: -f2- | tr -d '"\\' \
    > websites.txt

cat websites.txt | rev | cut -d. -f1,2 | rev | tee fortune1000.txt
