sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
sudo apt-get -y update 2>&1 >/dev/null
sudo /usr/bin/apt-get -y install git zsh autojump rcm

if [ ! -d "$HOME/.dotfiles" ]; then
    echo -e  "\n\033[0;32m >> Clone leroux/dotfiles repository\033[0m"
    git clone git://github.com/leroux/dotfiles.git "$HOME/.dotfiles"
else
    echo -e "\n\033[0;32m >> leroux/dotfiles is already available\033[0m"
fi
echo -e "\n\033[0;32m >> Installing dotfiles...\033[0m"
rcup
