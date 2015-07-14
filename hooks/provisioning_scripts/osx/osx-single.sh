$XCODE_CLI_TOOLS = "/tmp/xcode-cli-tools.sh"
$DOTFILES_DIR = "$HOME/.dotfiles"
$DOTFILES_LOCAL_DIR = "$HOME/.dotfiles-local"

echo "\n\033[0;32m>>> Pre-install cleanup\033[0m"
if [ -$XCODE_CLI_TOOLS ]; then
    rm -f $XCODE_CLI_TOOLS
fi
if [ -d $DOTFILES_DIR ]; then
    rm -rf $DOTFILES_DIR
fi
if [ -d $DOTFILES_LOCAL_DIR ]; then
    rm -rf $DOTFILES_LOCAL_DIR
fi

echo "\n\033[0;32m>>> Install xcode\033[0m"
curl -L https://raw.githubusercontent.com/andrewtchin/dotfiles/master/hooks/provisioning_scripts/osx/xcode-cli-tools.sh -o $XCODE_CLI_TOOLS
chmod +x $XCODE_CLI_TOOLS
$XCODE_CLI_TOOLS

echo "\n\033[0;32m>>> Install homebrew\033[0m"
# Insecure...yeah... (should expand to the contents of the script)
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" || true

echo "\n\033[0;32m>>> Install rcm\033[0m"
brew tap thoughtbot/formulae
brew install rcm

echo "\n\033[0;32m>>> Run rcm\033[0m"
git clone https://github.com/andrewtchin/dotfiles-local $DOTFILES_LOCAL_DIR
git clone https://github.com/andrewtchin/dotfiles $DOTFILES_DIR
RCRC="$DOTFILES_DIR/rcrc"
$DOTFILES_DIR/bin/rcup
