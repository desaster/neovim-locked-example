#!/bin/bash

set -e

mydir=$(dirname $0)
if [ "$mydir" == "" ]
then
    echo "Couldn't figure out working directory!"
    exit 2
fi

rm -f $mydir/config/nvim/plugin/packer_compiled.lua
rm -rf $mydir/data/nvim/
rm -rf $mydir/cache/nvim/
