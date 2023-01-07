#!/bin/bash
set -e
set -x

# ohmyzsh
if [ ! -f $HOME/.install-zsh ]
then
  rm -rf $HOME/.oh-my-zsh
  rm -f $HOME/.zshrc
  git clone https://github.com/ohmyzsh/ohmyzsh $HOME/.oh-my-zsh
  ln -s $HOME/dotfiles/zshrc $HOME/.zshrc
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  cp $HOME/dotfiles/passion-custom.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/passion.zsh-theme
  chsh -s /bin/zsh
  touch $HOME/.install-zsh
else
  echo 'Already installed oh-my-zsh'
fi

# homebrew
if ! command -v brew &> /dev/null
then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# exa
brew install exa

# asdf
brew install asdf
# echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
asdf plugin add golang https://github.com/kennyp/asdf-golang.git || true
asdf plugin add java https://github.com/halcyon/asdf-java.git || true
asdf plugin add rust https://github.com/asdf-community/asdf-rust.git || true

# jq
brew install jq

# bat
brew install bat

# neovim
mkdir -p $HOME/.config/nvim
rm -f $HOME/.config/nvim/init.vim
brew install neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim/init.vim
nvim +PlugInstall +qall

# coreutils
brew install coreutils

# kubectl
brew install kubectl

# kube-ps1
brew install kube-ps1

# watch
brew install watch

# telnet
brew install telnet

# htop
brew install htop

# git
brew install git-lfs

# redis-cli
brew install redis-cli

# fzf
brew install fzf

# wget
brew install wget

# git
mkdir -p $HOME/.config/git
ln -s $HOME/dotfiles/gitignore $HOME/.config/git/ignore
