export WINHOME=/mnt/c/Users/khhan
export GDRIVE='/mnt/g/My Drive'

function important_details() {
    FILE=$GDRIVE/Documents/important_details.pgp
    TEMPFILE=/tmp/important_details.txt
    gpg -o $TEMPFILE -d $FILE

    if [ "$1" = "-a" ]; then
        vim -c 'set textwidth=80' -c 'set shiftwidth=2' -c 'set tabstop=2' $TEMPFILE
        rm $FILE
        gpg --symmetric --armor --output $FILE $TEMPFILE
        rm $TEMPFILE
    else
        less -x2 $TEMPFILE
        rm $TEMPFILE
    fi
    # reload gpg agent to discard saved password
    gpg-connect-agent reloadagent /bye
}

function proton_extract() {
    #TODO   
}

alias venv="source ./venv/bin/activate"
