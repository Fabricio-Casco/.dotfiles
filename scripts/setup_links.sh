#! /bin/bash

set -e
set -x

CURRENT_DATE_TIME=$(date +%Y-%m-%d-%H%M)
CONFIG_BACKUP=$HOME/.config_backup/${CURRENT_DATE_TIME}

if [ -d "$HOME/.config" ]; then
	if ! [ -L "$HOME/.config" ]; then
		MOVE_CONFIG=true
	else
		MOVE_CONFIG=false
	fi
fi

if [ "$MOVE_CONFIG" = true ]; then
	echo ".config backup."
	mkdir -p ${CONFIG_BACKUP}
	mv $HOME/.config ${CONFIG_BACKUP}
fi

rm -rf $HOME/.config
ln -sv $HOME/git/dotfiles/config/ $HOME/.config

if [ "$MOVE_CONFIG" = true ]; then
	cp -r ${CONFIG_BACKUP}/.config/. $HOME/.config
fi

rm -rf $HOME/bin/.local/scripts
mkdir -p $HOME/bin/.local/
ln -sv $HOME/git/dotfiles/scripts  $HOME/bin/.local/scripts

rm -rf $HOME/notes
ln -sv $HOME/git/dotfiles/notes  $HOME/notes

if [ -f $HOME/.zshenv ]; then
	echo ".zshenv backup."
	mkdir -p ${CONFIG_BACKUP}
	mv $HOME/.zshenv ${CONFIG_BACKUP}
fi
ln -sv $HOME/git/dotfiles/home/.zshenv  $HOME/.zshenv

mkdir -p $HOME/.config/wakatime
mkdir -p $HOME/.cache/zsh

#rm -rf ${CONFIG_BACKUP}
