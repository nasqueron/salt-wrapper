#!/bin/sh

#   -------------------------------------------------------------
#   Salt wrapper
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Created:        2016-04-10
#   License:        BSD-2-Clause
#   Usage:          salt-wrapper salt-call --local state.highstate
#   -------------------------------------------------------------

#   -------------------------------------------------------------
#   Helper functions
#
#   :: contains
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# contains(string, substring)
#
# Returns 0 if the specified string contains the specified substring,
# otherwise returns 1.
# See: https://stackoverflow.com/a/8811800/1930997
contains() {
    string="$1"
    substring="$2"
    if test "${string#*$substring}" != "$string"
    then
        return 0    # $substring is in $string
    else
        return 1    # $substring is not in $string
    fi
}

#   -------------------------------------------------------------
#   Wrapper code
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

CONFIG_DIR=$(salt-get-config-dir)
CODE=$?
if [ $CODE -ne 0 ]; then
	exit $CODE
fi

EXECUTABLE=$1
shift

# The default user is salt, but if we need to target the Salt
# master without a minion running, we need to run as root.
SALT_USER=salt
if [ "$EXECUTABLE" = "salt-call" ]; then
	contains "$*" "--local" && SALT_USER=root
fi

sudo -u $SALT_USER "$EXECUTABLE" --config-dir="$CONFIG_DIR" "$@"
