# Find shorthand
function f() {
    find . -name "$1" 2>/dev/null
}

# Extract most know archives
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)    gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)     uncompress $1  ;;
            *.7z)    7z x $1    ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
            esac
    else
        echo "'$1' is not a valid file"
    fi
}

low-case() {
    if [ $1 -eq 1 ]; then
        FROM="abcdefghijklmnopqrstuvwxyz"
        TO="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    else
        FROM="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        TO="abcdefghijklmnopqrstuvwxyz"
    fi
    find -type f | sed '
        h
        G
        s,^\(.*/\).*$,\1,
        x
        s,^.*/\(.*\)$,\1,
        y/'$FROM'/'$TO'/
        H
        x
        s,^\(.*\)\n\(.*\)\n\(.*\)$,mv "\1" "\2\3",
    ' | sh
}
# Down and up internet speed
function downspeed() {
    if [ -f $1 ] ; then
        sudo ipfw pipe 1 config bw "$1"Kbit/s delay 200ms
    else
        sudo ipfw pipe 1 config bw 128Kbit/s delay 200ms
    fi
    sudo ipfw add 1 pipe 1 src-port 80
}

function upspeed() {
    sudo ipfw flush
}
