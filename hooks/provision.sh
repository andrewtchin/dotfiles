#!/usr/bin/env bash
set -e

if [[ "$OSTYPE" == "darwin"* ]]; then
    source "${BASH_SOURCE%/*}/provisioning_scripts/osx/osx.sh"
fi
