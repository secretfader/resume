#!/usr/bin/env /bin/sh

# Terminate early on pipeline failure, since we use pipes below
set -e

# Create a reusable filter chain
RELEASE_FILTER="(.[0] | (select(.draft == false) | select(.prerelease == false)).assets[] | \
    select(.name | contains(\"x86_64-unknown-linux-gnu\"))).browser_download_url"

# Retrieve the latest stable release of Zola from GitHub
ZOLA_URL=$(curl -sS -H 'Accept: application/json' \
    https://api.github.com/repos/getzola/zola/releases | \
    jq -r "$RELEASE_FILTER"
)

S3UTIL_URL=$(curl -sS -H 'Accept: application/json' \
    https://api.github.com/repos/ryankurte/s3-util/releases | \
    jq -r "$RELEASE_FILTER"
)

# Make a directory at $HOME/bin to contain downloaded binaries
mkdir -p $HOME/bin

# Download binaries for Zola and S3 Util, extracting the archive contents to $HOME/bin
curl -sSL $ZOLA_URL | tar -xzf - -C $HOME/bin
curl -sSL $S3UTIL_URL | tar -xzf - -C $HOME/bin

# Install npm dependencies
npm ci