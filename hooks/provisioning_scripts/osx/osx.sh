#!/usr/bin/env bash -x

OSX_DIR="${BASH_SOURCE%/*}"

source "$OSX_DIR/osx-defaults.sh"
command -v xcodebuild >/dev/null 2>&1 || source "$OSX_DIR/xcode-cli-tools.sh"
source "$OSX_DIR/setup-brew.sh"
