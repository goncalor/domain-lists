#!/usr/bin/env bash

curl 'https://w3stats.com/top/domain-zone/com/[1-10]' | grep '/results/' | tr -d ' \t' | sed -e 's/<[^>]*>//g' | rev | cut -d. -f1,2 | rev | tee w3stats-com.txt
 
curl 'https://w3stats.com/top/domain-zone/pt/[1-10]' | grep '/results/' | tr -d ' \t' | sed -e 's/<[^>]*>//g' | rev | cut -d. -f1,2 | rev | tee w3stats-pt.txt
