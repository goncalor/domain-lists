#!/usr/bin/env bash

tail +2 top500Domains.csv | cut -d, -f2 | tr -d '"' | rev | cut -d. -f1,2 | rev | tee top500Domains.txt
