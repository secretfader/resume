#!/usr/bin/env /bin/sh

# Extend $PATH to include locally-installed binaries
PATH=$HOME/bin:$PATH:$(npm bin)
PORT=7878
DEPLOY_PRIME_URL="${DEPLOY_PRIME_URL:=https://resume.secretfader.com}"

# Build site and generate printable PDF
zola build -u $DEPLOY_PRIME_URL
zola build -u http://127.0.0.1:$PORT -o preview/ &> /dev/null
npm run generate-pdf