#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

SAVED_PWD=`pwd`
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__root="$(cd "$(dirname "${__dir}")" && pwd)" # <-- change this
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"

RCM_REPO="${BASH_SOURCE%/*}/.rcm"
LOCKFILE="/tmp/dotfiles.lock"

function cleanUp() {
  rm -f "${LOCKFILE}"
  cd "${SAVED_PWD}"
}

trap cleanUp EXIT INT TERM

# Check/get lock.
echo -n "Getting lock."
if [ -f "${LOCKFILE}" ]; then
    echo "..unable to get lock ${LOCKFILE}. rm ${LOCKFILE} to clean up stale state."
    exit 1
else
    echo "..got lock!"
    touch "${LOCKFILE}"
fi

# Install rcm, if it's not installed.
echo -n "Checking if rcm is installed."
if ! command -v rcup >/dev/null; then
    echo -n "..not found.\nBuilding/installing rcm."

    cd $RCM_REPO
    ./autogen.sh
    ./configure
    echo "..installed!"
    RCUP="${__dir}/.rcm/bin/rcup"
    chmod +x $RCUP
else
    echo "..found!"
    RCUP="rcup"
fi

# Invoke rcup with all arguments passed to this script.
"${RCUP}" "$@"

cd $SAVED_PWD
