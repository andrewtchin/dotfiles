#!/usr/bin/env bash

if [[ "$OSTYPE" == "darwin"* ]]; then
    source "${BASH_SOURCE%/*}/provisioning_scripts/osx/osx.sh"
fi
