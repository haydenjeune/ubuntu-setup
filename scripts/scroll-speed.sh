#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Scroll Speed
###############################################################################

NAME="Scroll Speed Configuration"

###############################################################################

print_banner "$NAME"

if [ ! -f "$MARKER_DIRECTORY"/"$MARKER" ]; then
    if [ ! -f ~/.imwheelrc ]; then
        sudo apt install imwheel -y
        cat >~/.imwheelrc<<EOF
".*"
None, Up,    Button4, 1
None, Down,  Button5, 1
None, Left, Button6, 1
None, Right,  Button7, 1
EOF
    fi
    VERTICAL_SCROLL_SPEED="3"
    HORIZONTAL_SCROLL_SPEED="2"
    sed -i "s/\($TARGET_KEY *Button4, *\).*/\1$VERTICAL_SCROLL_SPEED/" ~/.imwheelrc # find the string Button4, and write new value.
    sed -i "s/\($TARGET_KEY *Button5, *\).*/\1$VERTICAL_SCROLL_SPEED/" ~/.imwheelrc
    sed -i "s/\($TARGET_KEY *Button6, *\).*/\1$HORIZONTAL_SCROLL_SPEED/" ~/.imwheelrc
    sed -i "s/\($TARGET_KEY *Button7, *\).*/\1$HORIZONTAL_SCROLL_SPEED/" ~/.imwheelrc
    cat ~/.imwheelrc
    imwheel -kill
    finish_install "$MARKER"
else
    already_installed "$MARKER"
fi
