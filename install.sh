#!/bin/bash
set -e

set -a
. ./features.env
set +a

mkdir -p /usr/local/numbers

if [ ! -z ${_JOSHSPICER_DEVCONTAINER_ONE} ]; then
        bash ./one.sh
fi

if [ ! -z ${_JOSHSPICER_DEVCONTAINER_TWO} ]; then
        bash ./two.sh
fi

if [ ! -z ${_JOSHSPICER_DEVCONTAINER_THREE} ]; then
        bash ./three.sh
fi
