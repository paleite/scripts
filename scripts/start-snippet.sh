#!/usr/bin/env bash

# If the DEBUG variable is set to true, the script will run in debug mode. When
# in debug mode, the script will print each command as it is executed.

# The script will exit immediately if any command (or any command in a pipeline)
# returns a non-zero exit status. This is useful for catching errors early and
# making sure that the script does not continue executing with potentially
# unintended consequences (even when using pipes to chain commands together).

# It will also exit if an attempt is made to use an uninitialized variable. This
# is useful for catching typos and other mistakes that can lead to bugs
# downstream.

[[ "${DEBUG}" == 'true' ]] && set -o xtrace
set -o errexit
set -o pipefail
set -o nounset
