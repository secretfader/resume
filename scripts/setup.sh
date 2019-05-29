#!/usr/bin/env bash
ZOLA_VERSION="0.6.0"
BASE_URL="https://github.com/getzola/zola/releases/download"
FILE=zola-v$ZOLA_VERSION-x86_64-unknown-linux-gnu.tar.gz

apt-get update && \
apt-get install -y gconf-service libasound2 libatk1.0-0 libatk-bridge2.0-0 \
                   libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 \
                   libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 \
                   libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 \
                   libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 \
                   libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates \
                   fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget curl &&
curl -s -L $BASE_URL/v$ZOLA_VERSION/$FILE | \
tar xzf - -C /usr/bin
