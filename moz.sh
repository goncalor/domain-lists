#!/usr/bin/env bash

curl -s 'https://moz.com/top-500/download?table=top500Domains' | tail +2 | tr -d '"' | cut -d, -f2 | tee moz.txt
