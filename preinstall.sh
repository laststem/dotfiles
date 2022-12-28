#!/bin/bash
set -e
set -x

git clone https://github.com/laststem/dotfiles $HOME/dotfiles

# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s $HOME/dotfiles/zshrc $HOME/.zshrc

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# exa
brew install exa

# asdf
brew install asdf
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc

asdf plugin add golang https://github.com/kennyp/asdf-golang.git
asdf install golang 1.19.0
asdf global golang 1.19.0

asdf plugin add java https://github.com/halcyon/asdf-java.git
asdf install java openjdk-11
asdf global java openjdk-11
. ~/.asdf/plugins/java/set-java-home.zsh

asdf plugin add rust https://github.com/asdf-community/asdf-rust.git
asdf install rust 1.65.0
asdf global rust 1.65.0

# jq
brew install jq

# bat
brew install bat

# neovim
brew install neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# coreutils
brew install coreutils

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

# zsh theme
wget https://github.com/ChesterYue/ohmyzsh-theme-passion -O $ZSH_CUSTOM/themes/passion.zsh-theme
