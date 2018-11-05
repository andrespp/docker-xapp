#!/bin/bash

# Sets script to fail if any command fails.
set -e

set_xauth() {
	echo xauth add $DISPLAY . $XAUTH
	touch ~/.Xauthority
	xauth add $DISPLAY . $XAUTH
}

print_usage() {
echo "

Usage:	$0 COMMAND

XAPPS Container

Options:
  help		Print this help
  xcalc		Run xcalc
  xeyes		Run xeyes
"
}

case "$1" in
    help)
        print_usage
        ;;
    xcalc)
	set_xauth
        xcalc
        ;;
    xeyes)
	set_xauth
	xeyes
        ;;
    *)
        exec "$@"
esac
