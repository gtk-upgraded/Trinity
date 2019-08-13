#!/bin/bash

# A script to quickly generate a list, bundle or all indexed themes
# Author: Christian Medel <cmedelahumada@gmail.com>
# License: GPLv3

version=1.0
description="Azurra Autogen Light, version $version"
base_theme='Azurra'
ROOT_DIR="$PWD"
sass_args="-C --sourcemap=none"

# standard autogen functions 
load_conf() { source $1/*.conf; }
fail() { tput setaf 1 && echo 'ERROR: '$@ && exit 1; }
warn() { tput setaf 220 && echo 'WARNING: '$@ && tput sgr 0; }
hlight() { tput setaf 33 && echo $@ && tput sgr 0; }

# build and copy
compile() {
  load_conf $1
  echo "Compiling $(hlight $name)"

  for sass_file in $1/gtk*.scss; do
    local filename=${sass_file%".scss"}
    sass $sass_args $sass_file $filename.css

    [ $? -ne 0 ] && fail "SASS exited unexpectedly, aborting"
  done

  echo 'done'
}

compile src

# remove previous assets
rm -rf gtk-3.0/assets

cp -r src/*.css gtk-3.0
cp -r src/assets gtk-3.0/assets
