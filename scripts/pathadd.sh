#!/bin/bash

# usage:
# ./pathadd.sh PATH "$HOME/.local/bin"

if [ "$EUID" -eq 0 ]; then
    echo "don't run as root"
    exit 1
fi

cd $(dirname $0)

main() {
    envname=$1
    eval envpath='$'$envname
    pathtoadd="${2%/}"
    eval $envname=\""$(echo $envpath | sed -r -e 's;:{2,};:;g' -e 's;^:|:$;;g')"\"
    if [[ -d "$pathtoadd" && $(echo $envpath | grep -E -c "(^|:)$pathtoadd($|:)") -eq 0 ]]; then
        if [ "$3" = "after" ]; then
            eval export $envname=\""$envpath:$pathtoadd"\"
        else
            eval export $envname=\""$pathtoadd:$envpath"\"
        fi
    fi
}

main "$@"
