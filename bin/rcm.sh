#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__root="$(cd "$(dirname "${__dir}")" && pwd)" # <-- change this
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"

RCM_REPO="${BASH_SOURCE%/*}/rcm"

locate_rcm_exec () {
    RCM_SUBEXEC="${1}"

    echo -n "Checking if rcm is installed."
    if FOUND_RCM_SUBEXEC=$(command -v "${RCM_SUBEXEC}" 2>&1); then
        echo "..found!"
    else
        echo -n "..not found.\nBuilding."

        pushd $RCM_REPO
        ./autogen.sh || :
        ./configure
        echo "..built!"
        popd

        chmod +x "${RCM_REPO}"/bin/{lsrc,mkrc,rcdn,rcup}
        PATH="${RCM_REPO}/bin:$PATH"
    fi

    FOUND_EXEC=$(which "${RCM_SUBEXEC}")
}

main () {
    RCM_SUBCOMMAND="${1:-${__base}}" # call rcup by default...
    locate_rcm_exec "${RCM_SUBCOMMAND}" #==> FOUND_EXEC
    echo "Executing ${FOUND_EXEC} with arguments: ${*:2}"
    "${FOUND_EXEC}" "${*:2}"
}

main "$@"
