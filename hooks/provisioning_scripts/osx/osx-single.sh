curl -L https://raw.githubusercontent.com/andrewtchin/dotfiles/master/hooks/provisioning_scripts/osx/xcode-cli-tools.sh -o /tmp/xcode-cli-tools.sh
chmod +x /tmp/xcode-cli-tools.sh
/tmp/xcode-cli-tools.sh

# Install homebrew.
# Insecure...yeah... (should expand to the contents of the script)
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" || true

brew tap thoughtbot/formulae
brew install rcm

git clone https://github.com/andrewtchin/dotfiles-local ~/.dotfiles-local
git clone https://github.com/andrewtchin/dotfiles ~/.dotfiles
RCRC="~/.dotfiles/rcrc"
~/.dotfiles/bin/rcup
