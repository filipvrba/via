#!/bin/bash

git submodule init &&
git submodule update &&
bin/linking.sh

echo
echo "Via has been installed."
echo "You it a try typing to a console 'via -v'"