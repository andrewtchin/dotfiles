#!/usr/bin/env bash -x

taps=(
    caskroom/fonts
    homebrew/binary
    homebrew/dupes
    homebrew/versions
    thoughtbot/formulae
)

pkgs=(
    brew-cask
    openssh
    rcm
    zsh
    vim
    irssi
    autojump
    wget
    terminal-notifier
    cmake
    bitlbee
)

cask_apps=(
    font-inconsolata-dz-for-powerline
    google-chrome
    iterm2
    firefox
    vlc
    caffeine
    gpgtools
    java
    playonmac
    xquartz
    wireshark
)

# Install homebrew.
# Insecure...yeah... (should expand to the contents of the script)
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew taps
for tap in "${taps[@]}"; do
    brew tap $tap
done

brew install "${pkgs[@]}"
brew cask install "${cask_apps[@]}"
