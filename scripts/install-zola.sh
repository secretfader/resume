#!/usr/bin/env /bin/sh

# Terminate early on pipeline failure, since we use pipes below
set -e

# Retrieve the latest stable, extended release version from GitHub
DOWNLOAD_URL=$(curl --silent -H 'Accept: application/json' \
    https://api.github.com/repos/getzola/zola/releases | \
    jq -r "(.[0] |
    (select(.draft == false) | select(.prerelease == false)).assets[] |
        select(.name | contains(\"x86_64-unknown-linux-gnu.tar.gz\"))
    ).browser_download_url"
)

# Make a directory at $HOME/bin to contain downloaded binaries
mkdir -p $HOME/bin

# Download the Hugo binary and extract the tar.gz archive $HOME/bin
curl -sSL $DOWNLOAD_URL | tar -xzf - -C $HOME/bin