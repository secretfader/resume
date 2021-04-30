#!/usr/bin/env bash
zola build -u $DEPLOY_PRIME_URL && \
zola build -u http://127.0.0.1:7878 -o preview/ && \
npm ci && npm run generate-pdf
