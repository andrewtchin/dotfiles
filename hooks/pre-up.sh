#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__root="$(cd "$(dirname "${__dir}")" && pwd)" # <-- change this
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"

: ${RCRC:=$HOME/.rcrc}
[ -r "$RCRC" ] && . "$RCRC"

: ${PROVISION:=no}
if [ "$PROVISION" = "yes" ]; then
    source "${BASH_SOURCE%/*}/provision.sh"
fi
