#!/usr/bin/env bash

ALEXA_TOP=500

cat <(head -q -n$ALEXA_TOP alexa.txt alexa-*.txt) \
    <(cat fortune.txt | rev | cut -d. -f1,2 | rev) \
    moz.txt \
    w3stats-*.txt \
    | sort -u \
    | tee domains.txt \
    | wc -l
