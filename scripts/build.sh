#!/usr/bin/env /bin/sh

# Terminate early on pipeline failure
set -e

# Extend $PATH to include locally-installed binaries
PATH=$PATH:$HOME/bin

# Build site and generate printable PDF
zola build -u $DEPLOY_PRIME_URL && \
zola build -u http://127.0.0.1:7878 -o preview/ && \
npm run generate-pdf