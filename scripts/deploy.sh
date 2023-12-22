#!/bin/bash

cd $(dirname $0)
cd ../files

create_symbolic_link() {
    from=$(cd $(dirname $1); pwd)/$(basename $1)
    to=${from#$PWD}
    to=${to:1}
    mkdir -p "${HOME}/$(dirname ${to})"
    ln -fns "${from}" "${HOME}/${to}"
    echo "Created Symbolic Link $from -> ${HOME}/${to}"
}

main() {
    for file in $(\find ./ -maxdepth 30 -type f); do
        create_symbolic_link $file
    done
}

main
