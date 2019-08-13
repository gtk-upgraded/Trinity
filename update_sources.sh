#!/bin/bash

fail() { tput setaf 1 && echo 'ERROR: '$@ && exit 1; }

AZURRA_PATH=$HOME/Github/Azurra_framework

[ ! -d $AZURRA_PATH ] && fail 'Source directory not found. You need a copy of https://github.com/B00merang-Project/Azurra_framework installed'

input="sources"
while IFS= read -r line
do
  cp -r $AZURRA_PATH/$line src/widgets
done < "$input"

cp -r $AZURRA_PATH/Azurra/_functions.scss src
cp -r $AZURRA_PATH/Azurra/_colors_public.scss src
cp -r $AZURRA_PATH/Azurra/_common.scss src

echo "Sources updated"
