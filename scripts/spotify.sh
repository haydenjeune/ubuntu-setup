#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Spotify
###############################################################################
# URL: https://www.spotify.com/us/download/linux/
###############################################################################

NAME="Spotify"

###############################################################################

SPOTIFY_REPO_GPG_KEY=https://download.spotify.com/debian/pubkey_0D811D58.gpg
SPOTIFY_REPO_URL=http://repository.spotify.com

###############################################################################

print_banner "$NAME"

if [ ! -f "$MARKER_DIRECTORY"/"$MARKER" ]; then
    curl -sS $SPOTIFY_REPO_GPG_KEY | sudo apt-key add - \
    && echo "deb $SPOTIFY_REPO_URL stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list \
    && sudo apt-get update \
    && sudo apt-get install spotify-client \
    && finish_install "$MARKER"
else
    already_installed "$MARKER"
fi