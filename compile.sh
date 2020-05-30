#!/usr/bin/env bash

ALEXA_TOP=500
ALEXA_FILES="alexa.txt alexa-*.txt"
FORTUNE_FILES="fortune.txt"
MOZ_FILES="moz.txt"
W3STATS_FILES="w3stats-*.txt"
OUTFILE="domains.txt"

cat <(head -q -n$ALEXA_TOP $ALEXA_FILES) \
    <(cat $FORTUNE_FILES | rev | cut -d. -f1,2 | rev) \
    moz.txt \
    $W3STATS_FILES \
    | sort -u \
    | tee "$OUTFILE" \
    | wc -l

tar cvaf domains.tar.gz $OUTFILE $ALEXA_FILES $FORTUNE_FILES $MOZ_FILES $W3STATS_FILES
