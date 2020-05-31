#!/usr/bin/env bash

# to update this URL, go to Fortune 500 list and check requests that load the info about companies
URL='https://content.fortune.com/wp-json/irving/v1/data/franchise-search-results?list_id=2814606'
FRANCHISES='fortune-franchises.json'
PERMALINKS='fortune-permalinks.txt'
WEBSITES='fortune-websites.txt'
OUTFILE='fortune.txt'

curl -o $FRANCHISES $URL

grep -Po '"permalink":"[^"]+"' $FRANCHISES | sort -u | cut -d: -f2- | tr -d '"\\' | tee $PERMALINKS

while read perma; do
    curl -s "$perma";
done < $PERMALINKS \
    | grep --line-buffered -Po '"website":"[^"]+"' \
    | tee /dev/tty | uniq | cut -d: -f2- | tr -d '"\\' \
    > $WEBSITES

cat $WEBSITES | sed -e 's/.*:\/\///g' | tr -d '/' | tee $OUTFILE
