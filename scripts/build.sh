#!/usr/bin/env bash
$HOME/bin/zola build -u $DEPLOY_PRIME_URL && \
$HOME/bin/zola build -u http://127.0.0.1:7878 -o preview/ && \
npm run generate-pdf
