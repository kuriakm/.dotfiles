#!/bin/bash

# Removes .vimrc if it exists in the home directory
rm -f ~/.vimrc

# Searches for the line "bashrc_custom" and removes
# it from the original file (regular expression is used to prevent errors)
sed -i "/bashrc_custom/d" ~/.bashrc

# Removes .TRASH if it exists in the home directory
rm -rf ~/.TRASH
