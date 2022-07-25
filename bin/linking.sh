#!/bin/bash

abspath=$(realpath $0)
binpath=${abspath%/*}
runpath=$binpath/run.sh

ln -s $runpath ~/.local/bin/via &&
echo "Link by created under name 'via'."