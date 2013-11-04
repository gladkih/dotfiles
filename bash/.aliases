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
alias dwl='cd ~/Downloads/'
alias drp='cd ~/Dropbox/'
alias wrk='cd ~/work/'

# Show/hide hidden files in Finder
alias show='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias hide='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
alias showdesktop='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'

#Clean
alias cleanup='find . -name "*.DS_Store" -type f -delete'
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Shortcuts
alias cleanup='find . -name "*.DS_Store" -type f -delete'

# List files in human readable format with color and without implied directories
alias ls='ls -lAh'

# Show hidden files only
alias ls.='ls -dAh .*'

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"