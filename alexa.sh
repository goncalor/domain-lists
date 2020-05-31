#!/usr/bin/env bash

DEFAULT=(com org pt)
TLDS=(${@:-${DEFAULT[@]}})  # use arguments or default
OUTFILE='alexa.txt'

if [ ! -f "$OUTFILE" ]; then
    curl http://s3.amazonaws.com/alexa-static/top-1m.csv.zip | zcat - | cut -d, -f2 > "$OUTFILE"
fi

for tld in "${TLDS[@]}";
do
    echo -ne ".$tld\t"
    grep "\\.$tld$" "$OUTFILE" | tee "alexa-$tld.txt" | wc -l
done
