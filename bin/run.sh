#!/bin/bash

abspath=$(realpath $0)
abspath=${abspath%/*/*}
ruby $abspath/src/app.rb $@