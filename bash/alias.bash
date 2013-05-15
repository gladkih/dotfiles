# color bash
PS1='\t\[[\e[0;32m\]\u\[\e[m\]|\[\e[1;34m\]\w\[\e[m\]] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;37m\] '

# Jump back n directories at a time
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias ~='cd ~'

# Link
alias prj='cd ~/work/project/'
alias dwl='cd ~/Downloads/'
alias drp='cd ~/Dropbox/'
alias wrk='cd ~/work/'

# Shortcuts
alias +x='chmod +x'
alias e='vim'
alias cleanup='rm -rf ~/.local/share/Trash/files/* ~/.local/share/Trash/info/* rm -rf ~/.Trash/*'

# Show active network listeners
alias netlisteners='lsof -i -P | grep LISTEN'

# List files in human readable format with color and without implied directories
alias ls='ls -lAh --color'

# Show hidden files only
alias ls.='ls -dAh .* --color=auto'

# Ubuntu update, apt, upgrade
alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'

