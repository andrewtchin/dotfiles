#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

# Install crontab
crontab ~/.crontab

# Set zsh as default shell.
chsh -s $(which zsh)

# Install vim bundles.
if [ ! "$(ls -A $HOME/.vim/bundle >/dev/null 2>&1)" ]; then
  vim +BundleInstall +qa
fi

#
# Build needed binary components for vim plugins
#
VIMPROC_DIR="$HOME/.vim/bundle/vimproc"
if [ -d "$VIMPROC_DIR" ]; then
    cd $VIMPROC_DIR; make>/dev/null || :; cd ~-
fi

YCM_DIR="$HOME/.vim/bundle/YouCompleteMe"
if [ -d "$YCM_DIR" ] &&
   [ ! $(ls -A $YCM_DIR/third_party/ycmd/ycm_core.* >/dev/null 2>&1) ]; then
    echo "Building YCM."
    cd $YCM_DIR
    ./install.sh --clang-completer || :
    cd ~-
fi
