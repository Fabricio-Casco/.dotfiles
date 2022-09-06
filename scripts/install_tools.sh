#!/bin/bash

set -e
set -x

# begin apt packages
sudo apt update
sudo apt upgrade

sudo apt-get install -y \
	build-essential procps curl wget \
	file git ninja-build gettext libtool \
	libtool-bin autoconf automake \
	g++ pkg-config unzip doxygen \
        cmake ripgrep \

#end apt packages


# begin direcotrios
mkdir -p $HOME/git
mkdir -p $HOME/build
mkdir -p $HOME/projects

# end direcotrios

# begin tmux
if  [ -x "$(command -v tmux)" ]; then
	echo "Tmux ya esta instalado."
else
	echo "Instalando tmux."
	sudo apt install tmux -y
fi

# end tmux


# begin neovim
if  [ -x "$(command -v nvim)" ]; then
	echo "Neovim ya esta instalado."
else
	if ! [ -d $HOME/build/neovim ]; then
		echo "Cloning Neovim a ~/build/neovim"
		git clone https://github.com/neovim/neovim $HOME/build/neovim
	fi
	cd $HOME/build/neovim
	echo "Instalando Neovim from source"
	make
	sudo make install
fi

if ! [ -d $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
	echo "Instalando Packer"
	git clone --depth 1 https://github.com/wbthomason/packer.nvim \
	$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
else
	echo "Packer ya esta instalado"
fi

# end neovim


# begin rust
if  [ -x "$(command -v cargo)" ]; then
	echo "Rust ya esta instalado."
else
	echo "Instalando Rust."
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	source "$HOME/.cargo/env"
fi

rustup component add rust-src
rustup +nightly component add rust-analyzer-preview

# end rust


# begin node
if  [ -x "$(command -v node)" ]; then
	echo "Node ya esta instalado."
else
	echo "Instalando Node."
	curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
	sudo apt-get install nodejs
fi
# end node


# begin lang servers
if  [ -x "$(command -v npm)" ]; then
  sudo npm install -g diagnostic-languageserver
  sudo npm install -g dockerfile-language-server-nodejs
  sudo npm install -g vscode-langservers-extracted
  sudo npm install -g typescript-language-server typescript
fi
# end node


# begin zsh
if  [ -x "$(command -v zsh)" ]; then
	echo "ZSH ya esta instalado."
else
	echo "Instalando ZSH."
	sudo apt install zsh -y
fi

if ! [ -d $HOME/.oh-my-zsh/ ]; then
	echo "Instalando OH MY ZSH."
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# end zsh
