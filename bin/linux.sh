#!/bin/bash

# If the output of uname is equal to Linux, the statement
# "Your operating system is Linux" is outputted to the console
# Otherwise, the output of uname is sent to the linuxsetup.log and
# the exit command is run
if [ $(uname) = 'Linux' ]; then
	echo "Your operating system is $(uname)"
else
	uname 2> linuxsetup.log
	exit
fi

# Creates the directory .TRASH if it does not already
# exist in the home directory
mkdir -p ~/.TRASH/

# Creates .vimrc in the home directory
touch ~/.vimrc

# Renames .vimrc to .bup_vimrc if it was found in the
# home directory and outputs the statement
# ".vimrc has been changed to .bup_vimrc" to the linuxsetup.log

if [[ -f ~/.vimrc ]]; then
	mv ~/.vimrc ~/.bup_vimrc | echo ".vimrc has been changed to .bup_vimrc" >> linuxsetup.log
fi

# Takes the output of cat etc/vimrc and uses it to overwrite .vimrc
cat etc/vimrc > ~/.vimrc

# Appends "source ~/.dotfiles/etc/bashrc_custom" to the end of .bashrc
echo "source ~/.dotfiles/etc/bashrc_custom" >> ~/.bashrc
