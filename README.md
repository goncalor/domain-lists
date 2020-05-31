domain-lists
============

A set of scripts to obtain a list of domains from multiple sources.

For your convenience, you can download the output of some runs of the scripts in [Releases][releases].

Scripts
-------

- `alexa.sh [tld]...` downloads Alexa Top 1M list. Creates files with domains ending with specified TLDs
- `fortune.sh` downloads a list of domains for the Fortune 1000 company list
- `moz.sh` downloads Moz's top 500 domains
- `w3stats.sh [tdl]...` downloads top sites from W3Stats for the specified TLDs
- `compile.sh` compiles a selection of the outputs from other scripts, which must be run first

Examples
--------

```
$ ./alexa.sh com org net com.br
.com    397560
.org    27436
.net    28867
.com.br 6279

$ ls -1 alexa*.txt
alexa.txt
alexa-com.txt
alexa-org.txt
alexa-net.txt
alexa-com.br.txt
```

[releases]: https://github.com/goncalor/domain-lists/releases/
[fortune500]: https://fortune.com/fortune500/
