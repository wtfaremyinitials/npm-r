#!/bin/bash

# check that `jq` is installed
if ! type jq &> /dev/null; then
    echo "[npm-r] missing dependency jq"
    exit 1
fi

# confirm that a first argument was passed
if [ -z "$1" ]; then
    echo "usage: npm-r <subcommand>"
    exit 1
fi

# define the first argument as the subcommand
SUBCMD="$1"

# traverse the filesystem upward looking for package.json
while [ ! -f ./package.json ]
do
    # if we get to root, give up
    if [ "$PWD" == "/" ]; then
        echo "[npm-r] unable to find package.json"
        exit 1
    fi

    # keep looking
    cd ..
done

# read the command from package.json
CMD=$(jq -r ".scripts.$SUBCMD" < package.json)

if [ "$CMD" == "null" ]; then
    echo "[npm-r] no such subcommand '$1'"
    exit 1
fi

# add additional arguments
CMD="$CMD ${@:2}"

echo -e '\033[37m$ '$CMD'\033[39m'

# add `./node_modules/.bin` to $PATH
PATH=$PATH:./node_modules/.bin

# exec the command
exec bash -c "$CMD"
