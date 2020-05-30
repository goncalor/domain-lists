#!/usr/bin/env bash

curl http://s3.amazonaws.com/alexa-static/top-1m.csv.zip | zcat - | cut -d, -f2 > alexa.txt

for tld in com pt;
do
    echo .$tld
    grep "\\.$tld$" alexa.txt | tee "alexa-$tld.txt" | wc -l
done
