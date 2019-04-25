#!/usr/bin/env bash
ZOLA_VERSION="0.6.0"
BASE_URL="https://github.com/getzola/zola/releases/download"
FILE=zola-v$ZOLA_VERSION-x86_64-unknown-linux-gnu.tar.gz

curl -s -L $BASE_URL/v$ZOLA_VERSION/$FILE | \
tar xzf - -C ./ && \
# Build real output
./zola build -u $DEPLOY_PRIME_URL && \
# Build preview output
./zola build -u http://127.0.0.1:7878 -o preview/ && \
npm ci && npm run generate-pdf
