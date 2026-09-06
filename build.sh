#!/bin/bash -eu
# build project

chmod +x assets/urlparse/urlparse_fuzz.py clean_corpus.sh

python3 -m venv /tmp/venv
source /tmp/venv/bin/activate

pip3 install rfc3986/

