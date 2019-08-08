#!/bin/bash

fail() { tput setaf 1 && echo 'ERROR: '$@ && exit 1; }

AZURRA_PATH=$HOME/Github/Azurra_framework

[ ! -d $AZURRA_PATH ] && fail 'Source directory not found. You need a copy of https://github.com/B00merang-Project/Azurra_framework installed'

themes=(Android Azurra B00merang/blackout iOS macOS OS_X_10.10 Solaris_9 System_4 Win_10)

for theme in ${themes[@]}; do
  echo "Updating $theme"
  
  if [ $theme == 'B00merang/blackout' ]; then
    cp -r $AZURRA_PATH/$theme src/B00merang
  else
    cp -r $AZURRA_PATH/$theme src
  fi 
done

echo "Sources updated"
