#!/usr/bin/env bash

set -e

###############################################################################
# rustup.rs - The Rust toolchain installer
###############################################################################
# URL: https://github.com/creationix/nvm
###############################################################################

NAME="rustup.rs (rustup)"
MARKER=rustup

###############################################################################

print_banner "$NAME"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y \
    && finish_install $MARKER
else
    already_installed $MARKER
fi
