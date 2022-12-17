#!/bin/bash
VERSION="1.alpha"

# Leer input flags
# h, help => print usage
# i, install [tool] => method not implemented (yet)
# u, uninstall [tool] => method not implemented (yet)
# r, reinstall [tool] => method not implemented (yet)

# Para cada una de las herramientas disponibles
# Llamar a su instalador
# los instaladores deberian
#   validadar si la herramienta ya esta instalada

main() {
  echo "Fabricio Nicolás Casco - Tools Installer v$VERSION"
  tool_install_prompt "Packages" "ORANGE"
}

tool_install_prompt() {
  # Black        0;30     Dark Gray     1;30
  # Red          0;31     Light Red     1;31
  # Green        0;32     Light Green   1;32
  # Brown/Orange 0;33     Yellow        1;33
  # Blue         0;34     Light Blue    1;34
  # Purple       0;35     Light Purple  1;35
  # Cyan         0;36     Light Cyan    1;36
  # Light Gray   0;37     White         1;37
  RED='\033[0;31m' ORANGE='\033[0;33m'
  NC='\033[0m' # No Color
  TOOL=$1 TOOL_COLOR="${2:-NC}" INSTALLED="${3:-false}"
  echo $INSTALLED

  if ! $INSTALLED; then
    printf "Instalar ${!TOOL_COLOR}${TOOL}${NC}\n"
  else
    printf "${!TOOL_COLOR}${TOOL}${NC} ${RED}ya esta instalado${NC}\n"
  fi
  # ask_input
}

ask_input() {
  DSFE=""
  OPTIONS="[YyNn]"
  until [[ $DSFE == $OPTIONS ]]; do
    read -p "Delete Source File After Encryption? [Y|N] " DSFE
  done
}

case $DSFE in
        [Yy]) echo "yes" ;;
        [Nn]) echo "no" ;;
        *)    # this code should not be reached
esac

#Packages
#Base dirs
#Tmux
#Neovim
#nvim-lsp
#Packer
#Neovim providers
#win32yank
#Rust
#Node
#Deno
#Ninja
#ZSH
#oh-my-zsh

main
