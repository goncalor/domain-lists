#!/usr/bin/env bash

DEFAULT=(com pt)
TLDS=(${@:-${DEFAULT[@]}})  # use arguments or default

for tld in "${TLDS[@]}";
do
    echo .$tld
    curl "https://w3stats.com/top/domain-zone/$tld/[1-20]" \
        | grep '/results/' | tr -d ' \t' | sed -e 's/<[^>]*>//g' \
        | tee "w3stats-$tld.txt" | wc -l
done
