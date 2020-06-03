#!/bin/bash

cd ~
rm -rf fonts/
gpip3 install powerline-shell
cd ~
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts/
./install.sh
cd ..
rm -rf fonts/
