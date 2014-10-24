export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Screenshot: http://i.imgur.com/s0Blh.png
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi

#Shell color
MAGENTA="\033[1;31m"
RED="\033[31m"
ORANGE="\033[1;33m"
GREEN="\033[1;32m"
PURPLE="\033[1;35m"
WHITE="\033[1;37m"
RESET="\033[m"
BOLD="$(tput bold)"

# color bash
export PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]👾  \[$ORANGE\]\h \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \": \") \[$RESET\]\n\[$GREEN\]>$RESET"
export PS2="\[$ORANGE\]→ \[$RESET\]"

# Jump back n directories at a time
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias ~='cd ~'

# Kill app
alias quit='killall -9'

# Link
alias dwl='cd ~/Downloads/'
alias drp='cd ~/Dropbox/'
alias wrk='cd ~/work/'

# Concat image
alias resize='mogrify -resize'
#Img optimization
alias imgopt='imageoptim -a -j -q -d'
#Create sprite (need glue)
function sprite-g() {
	glue "$1" "$1"-res --namespace '' --scss --padding=0 --margin=3
}
function sprite-g-retina() {
	glue "$1" "$1"-res --namespace '' --scss --padding=0 --margin=3 --retina
}

function sprite() {
	montage -background none ./$1/*.png -tile 1 -geometry +0+0 $1.png
}

function crop() {
	convert "$1" -crop 150x150 parts-%02d.jpg
}

# Удаление каждого второго файла
# Входной параметр — номер первой и последней папки
function rm-files() {
	for (( i=$1; i<=$2; i++))
	do
		cd $i
		n=1
		for file in ./*.png; do
		   test $n -eq 0 && rm "$file"
		   n=$((n+1))
		   n=$((n%2))
		done
		cd ..
	done
	
}

# Создание спрайтов
function mass-sprite() {
	for (( i=$1; i<=$2; i++))
	do
	   montage -background none ./$i/*.png -tile 1 -geometry +0+0 $i.png
	done
}

# Перемещение файлов по директория
function mass-replace() {
	for (( i=$1; i<=$2; i++))
	do
	   mkdir "$i" && mv $i.jpg ./$i
	done
}

#
function mass-crop() {
	for (( i=$1; i<=$2; i++))
	do
	   cd "$i"
	   convert "$i".jpg -crop 150x150 parts-%02d.jpg
	   cd ..
	done
}

function up() {
	softwareupdate -i -a
	brew update --rebase
	brew upgrade
	brew upgrade brew-cask
	brew cleanup -s --force
	npm update npm -g
	npm update -g
}

# Ping
alias pr='ping 192.168.1.1'
alias py='ping 8.8.8.8'

# Show/hide hidden files in Finder
alias show='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder && chflags nohidden ~/Public/ ~/Desktop/ ~/Applications/'
alias hide='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
alias showdesktop='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'

#Clean
alias cleanup='find . -name "*.DS_Store" -type f -delete'
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# List files in human readable format with color and without implied directories
alias ls='ls -GFh -G'

# Show hidden files only
alias ls.='ls -dAh .*'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Kill dublicates
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"


# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}

function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# Halu random
halu=(Tungjatjeta Hello Ahlen Marhaba Voghdzuyin Shlama Pryvitani Nomoskaar Zdraveite Zdravo Chao Aloha Hallo Gamardjobat Shalom Iiti Sawubona Salam Selamat Mendvt Terveh Mauri Haa Mej Ave Sveiki Sveikas Moien Zdravo Shumbrat Sawubona Goddag Ola Kails Buna Zdravstvuite Zdravo Dobry Sawatdi Isenmesez Merhaba Pryvit Paivaa Bonjour Namaste Zdravo Salam Saluton Tervist)
cnt=$(w -h | grep "^$(whoami) *s[^ ]* *-"|wc -l)
if [ $cnt == 1 ]; then
	echo -e $GREEN " Hostname"$RESET: `hostname`$RESET
	echo -e $GREEN "  Inet IP"$RESET: `ip`$RESET
	echo -e $GREEN " Local IP"$RESET: `ifconfig en0 inet | grep 'inet ' | awk ' { print $2 } '`
	echo -e $GREEN "   Uptime"$RESET: `uptime | awk -F 'up ' '{ print $2 }' | awk -F ',' '{ print $1 }'`
	echo -e $GREEN "SSD usage"$RESET: `df / | awk '{print $5}' | grep "%"`
	echo ""
	echo -e $GREEN ${halu[RANDOM % 49]}$RESET,$MAGENTA $(whoami)$RESET.
fi
echo -e $GREEN "Date"$RESET: `date | awk '{print $2 " " $3 " " $4 " " $6}'`