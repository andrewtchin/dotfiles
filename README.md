leroux's dotfiles
=================
Inspired by [thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles) and made possible by
[rcm](https://github.com/thoughtbot/rcm), both of which are from [thoughtbot](https://github.com/thoughtbot).


Requirements
------------
- Install [rcm](https://github.com/thoughtbot/rcm).
- `chsh -s $(which zsh)  # you may have to point to /bin/zsh for brew-installed zsh`


User-Specific Customizations
----------------------------
Fork [dotfiles-local](https://github.com/leroux/dotfiles-local) and tune with your own settings.


Install
-------
```
# Clone your personal fork here.
# Files in ~/.dotfiles-local take precedence over ~/.dotfiles.
git clone git@github.com:leroux/dotfiles.git ~/.dotfiles-local

# Clone this repo.
git clone git@github.com:leroux/dotfiles.git ~/.dotfiles --recursive

# `bin/rcup` will install rcm if it is not available in $PATH.
RCRC="$HOME/.dotfiles/rcrc" rcup
```


Provisioning
------------
You can also pass `PROVISION=yes` as an environment variable to rcup to execute OS-specific provisioning scripts.
So far I've only added OS X provisioning scripts.
