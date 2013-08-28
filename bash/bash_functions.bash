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

# Count number of selectors in a CSS file
csscount() {
    cnt=0
    depth=0
    while read -n 1 char; do
        case $char in
            "{")
                ((depth++))
                ;;
            "}")
                ((depth--))
                if [ "$depth" -eq "0" ]; then
                    ((cnt++))
                fi
                ;;
            ",")
                ((cnt++))
                ;;
        esac
    done
    echo $cnt
}

# Password generator
password() {
    openssl rand -base64 ${1:-8}; 
}

# Copy public SSH key to clipboard. Generate it if necessary
ssh-key() {
    file="$HOME/.ssh/id_rsa.pub"
    if [ ! -f "$file" ]; then
        ssh-keygen -t rsa
    fi

    cat "$file" | c
    echo "Your public key copied to clipboard."
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
