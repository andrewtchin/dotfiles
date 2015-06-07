#!/usr/bin/env bash
set -e

LOCKFILE="/tmp/dotfiles.lock"

function cleanUp() {
  rm -f $LOCKFILE
}

trap cleanUp EXIT INT TERM

mktemp $LOCKFILE >/dev/null || { echo "Unable to get lock $LOCKFILE. Remove $LOCKFILE if you think this is a mistake."; exit 1; }

# Install rcm, if it's not installed.
if ! command -v rcup >/dev/null; then
    echo "Installing rcm."

    TMPDIR=`mktemp -d /tmp/$(basename $0)-dir.XXXX` || exit 1
    cd $TMPDIR

    curl -LO https://thoughtbot.github.io/rcm/dist/rcm-1.2.3.tar.gz

    sha=$(shasum -a 256 rcm-1.2.3.tar.gz | cut -f1 -d' ')
    [ "$sha" = "502fd44e567ed0cfd00fb89ccc257dac8d6eb5d003f121299b5294c01665973f" ]

    tar -xvf rcm-1.2.3.tar.gz
    cd rcm-1.2.3

    ./configure
    make
    make install
fi

# Invoke rcup with all arguments passed to this script.
rcup "$@"
