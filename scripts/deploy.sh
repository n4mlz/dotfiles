#!/bin/bash

cd $(dirname $0)
cd ../files

if [ "$EUID" -ne 0 ]; then
    SUDO_HOME=$HOME
else
    SUDO_HOME=$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)
fi

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
    chmod -R u+x $(cd ../; pwd)
}

main
