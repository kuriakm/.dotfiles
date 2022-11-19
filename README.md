# My Dotfiles
These are my dotfile configuration files for different software in Bash.

## vimrc

In my vimrc file, syntax is enabled to improve programming speed, while line numbers for rows and columns and autoindent are enabled for aesthetic purposes. The theme color is set to elflord, which changes how the text appears in Vim, and for Makefiles specifically autotab is disabled when entering a new line to prevent runtime errors when utilizing the file type. 

## bashrc_custom

In my bashrc_custom file, executables do not require ./ to be run because . was exported to $PATH from the export PATH=$PATH:. configuration. Also, several aliases have been created to improve speed such as cdd to go up to the parent directory, lsa to list almost all files, lsl to list files with additional information, lsal to combine the functionality of lsa and lsl into one alias, cselab to ssh into a Linux Lab computer using my username and an IP address, trash to move all files in the current directory to ~/.TRASH, and rmtrash to recursively and forcefully remove all contents that exist in ~/.TRASH. The aliases targz and untar use functions to complete their objectives, with targz tarring a directory provided in the first index of the command line argument and untar extracting a tar.gz file provided in the first index of the argument.

## Scripts and Makefile

### linux.sh

Linux.sh checks the operating system of the computer using uname and outputs "Your operating system is Linux" to the console if uname equals "Linux". Otherwise, an error message is dumped into the file linuxsetup.log and the terminal is closed with the 'exit' command. Afterwards, the directory .TRASH is created in the home directory (assuming it does not exist already) and .vimrc is also created in the home directory. If .vimrc exists in the home directory, it is renamed to .bup_vimrc and the message ".vimrc has been changed to .bup_vimrc" is echoed into linuxsetup.log. Finally, the output of etc/vimrc is redirected to a new .vimrc file and the string "source ~/.dotfiles/etc/bashrc_custom" is appended to .bashrc in the home directory. 

### cleanup.sh

Cleanup.sh essentially reverse all of what was done in linux.sh. It removes the file .vimrc and directory .TRASH from the home directory if they exist and edits out the line "source ~/.dotfiles/etc/bashrc_custom" from .bashrc.

### Makefile

The Makefile has two recipes called linux and clean that utilize linux.sh and cleanup.sh respectively. Given that the linux recipe requires the clean recipe to run first before it can begin, the file linuxsetup.log is removed (if it exists) before cleanup.sh executes. Afterwards, linuxsetup.log is created in the linux recipe before linux.sh is executed.
