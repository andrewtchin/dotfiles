#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__root="$(cd "$(dirname "${__dir}")" && pwd)" # <-- change this
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"

# Install vim bundles.
if [ ! "$(ls -A $HOME/.vim/bundle)" ]; then
  vim +BundleInstall +qa
fi

#
# Build needed binary components for vim plugins
#
VIMPROC_DIR="$HOME/.vim/bundle/vimproc"
if [ -d "$VIMPROC_DIR" ]; then
    cd $VIMPROC_DIR; make>/dev/null; cd ~-
fi

YCM_DIR="$HOME/.vim/bundle/YouCompleteMe"
if [ -d "$YCM_DIR" ] &&
   [ ! $(ls -A $YCM_DIR/third_party/ycmd/ycm_core.*) ]; then
    echo "Building YCM."
    cd $YCM_DIR
    ./install.sh --clang-completer
    cd ~-
fi

# Install crontab
crontab ~/.crontab
