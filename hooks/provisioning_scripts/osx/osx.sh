#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__root="$(cd "$(dirname "${__dir}")" && pwd)" # <-- change this
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

taps=(
    caskroom/fonts
    homebrew/binary
    homebrew/dupes
    homebrew/versions
    thoughtbot/formulae
)

pkgs=(
    aspell
    autojump
    bitlbee
    cmake
    coreutils
    git-crypt
    htop
    irssi
    jq
    keybase
    openssh
    rcm
    sshrc
    terminal-notifier
    the_silver_searcher
    tmux
    tree
    vim
    wget
    youtube-dl
    zsh
)

casks=(
    audacity
    bittorrent-sync
    caffeine
    firefox
    flux
    font-inconsolata-dz-for-powerline
    font-hack
    google-chrome
    gpgtools
    iterm2
    java
    playonmac
    spotify
    vlc
    wireshark
    xquartz
)

main () {
    source "${__dir}/osx-defaults.sh"
    command -v xcodebuild >/dev/null 2>&1 || source "${__dir}/xcode-cli-tools.sh"
    setup_brew "${taps}" "${pkgs}" "${casks}"

    # Install Preferences (in the form of plists)
    for plist in ${__dir}/*.plist; do
        install_plist $plist
    done
}

# setup_brew(taps, pkgs, casks)
setup_brew () {
    (( $# != 4 )) || { echo "$0 requires 3 parameters to be passed to it."; exit 1; }

    taps="${1:-}"
    pkgs="${2:-}"
    casks="${3:-}"

    # Install homebrew.
    # Insecure...yeah... (should expand to the contents of the script)
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" || true

    # brew taps
    for tap in "${taps[@]}"; do
        brew tap "${tap}"
    done

    brew install "${pkgs[@]}"

    brew install caskroom/cask/brew-cask
    brew cask install "${casks[@]}"
}

# install_plist(plist_path)
install_plist () {
    (( $# != 2 )) || { echo "$0 requires 2 parameters to be passed to it."; exit 1; }

    plist_path="${1:-}"
    plist_filename="$(basename $plist_path)"
    plist_domain="${plist_filename%.*}"

    defaults delete "${plist_domain}"
    cp "${plist_path}" "~/Library/Preferences"
    defaults read "${plist_domain}"
}

main "$@"

echo ""
echo "${red}Done. Reboot system as some changes only take effect on reboot.${reset}"
