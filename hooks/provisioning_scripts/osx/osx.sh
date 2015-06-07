#!/usr/bin/env bash -x
set -e

OSX_DIR="${BASH_SOURCE%/*}"

source "$OSX_DIR/osx-defaults.sh"
command -v xcodebuild >/dev/null 2>&1 || source "$OSX_DIR/xcode-cli-tools.sh"
source "$OSX_DIR/setup-brew.sh"

# Install iTerm preferences.
defaults delete com.googlecode.iterm2
cp $OSX_DIR/config/com.googlecode.iterm2.plist ~/Library/Preferences/
defaults read com.googlecode.iterm2 >/dev/null
