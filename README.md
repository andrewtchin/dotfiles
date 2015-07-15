andrewtchin's dotfiles
=================
Inspired by [thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles) and made possible by
[rcm](https://github.com/thoughtbot/rcm), both of which are from [thoughtbot](https://github.com/thoughtbot).


Requirements
------------
Set zsh as your login shell:
```
chsh -s $(which zsh)  # you may have to point to /bin/zsh for brew-installed zsh
```


User-Specific Customizations
----------------------------
Fork [dotfiles-local](https://github.com/andrewtchin/dotfiles-local) and tune with your own settings.


Install
-------
```
# Clone your personal fork here.
# Files in ~/.dotfiles-local take precedence over ~/.dotfiles.
git clone https://github.com/andrewtchin/dotfiles-local ~/.dotfiles-local

# Clone this repo.
git clone https://github.com/andrewtchin/dotfiles ~/.dotfiles

# `bin/rcup` will install rcm if it is not available in $PATH.
RCRC="~/.dotfiles/rcrc" ~/.dotfiles/bin/rcup
```

OSX one step install
--------------------
```
curl -Lo /tmp/osx-single.sh https://raw.githubusercontent.com/andrewtchin/dotfiles/master/hooks/provisioning_scripts/osx/osx-single.sh
chmod +x /tmp/osx-single.sh
/tmp/osx-single.sh
```
