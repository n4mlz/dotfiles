#!/bin/bash

cd $(dirname $0)
cd ../files

SUDO_HOME=$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)

create_symbolic_link() {
    from=$(cd $(dirname $1); pwd)/$(basename $1)
    to=${from#$PWD}
    to=${to:1}
    mkdir -p "${SUDO_HOME}/$(dirname ${to})"
    ln -fns "${from}" "${SUDO_HOME}/${to}"
    echo "Created Symbolic Link $from -> ${SUDO_HOME}/${to}"
}

main() {
    for file in $(\find ./ -maxdepth 30 -type f); do
        create_symbolic_link $file
    done
    chmod -R 777 $(cd ../; pwd)
}

main
