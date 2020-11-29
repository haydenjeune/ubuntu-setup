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
None,      Up,   Button4, 1
None,      Down, Button5, 1
Control_L, Up,   Control_L|Button4
Control_L, Down, Control_L|Button5
Shift_L,   Up,   Shift_L|Button4
Shift_L,   Down, Shift_L|Button5
EOF
    fi
    SCROLL_SPEED="3"
    sed -i "s/\($TARGET_KEY *Button4, *\).*/\1$SCROLL_SPEED/" ~/.imwheelrc # find the string Button4, and write new value.
    sed -i "s/\($TARGET_KEY *Button5, *\).*/\1$SCROLL_SPEED/" ~/.imwheelrc # find the string Button5, and write new value.
    cat ~/.imwheelrc
    imwheel -kill
    finish_install "$MARKER"
else
    already_installed "$MARKER"
fi
