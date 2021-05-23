#!/usr/bin/env /bin/sh

# Extend $PATH to include locally-installed binaries
PATH=$HOME/bin:$PATH:$(npm bin)
PORT=7878
ZOLA_ENVIRONMENT="${ZOLA_ENVIRONMENT:=production}"
DEPLOY_PRIME_URL="${DEPLOY_PRIME_URL:=https://resume.secretfader.com}"

# Build site and generate printable PDF
zola build -u $DEPLOY_PRIME_URL -o public/
zola build -u http://127.0.0.1:$PORT -o preview/ && npm run generate-pdf