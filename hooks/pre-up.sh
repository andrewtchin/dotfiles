#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

: ${RCRC:=$HOME/.rcrc}
[ -r "$RCRC" ] && . "$RCRC"

# Init submodules and fetch.
git submodule update --init --recursive

: ${PROVISION:=no}
if [ "$PROVISION" = "yes" ]; then
    source "${BASH_SOURCE%/*}/provision.sh"
fi
