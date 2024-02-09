#!/bin/bash

# usage:
# ./pathadd.sh PATH "$HOME/MyProject/MySoftware/bin" after

if [ "$EUID" -eq 0 ]; then
    echo "don't run as root"
    exit 1
fi

cd $(dirname $0)

main() {
    envname=$1
    eval envpath='$'$envname
    pathtorm="${2%/}"
    eval $envname=\""$(echo $envpath | sed -r -e "s;(^|:)$pathtorm(:|$);\1\2;g" -e 's;^:|:$;;g' -e 's;::;:;g')"\"
}

main "$@"
