#!/bin/bash

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
    brew tap vapor/tap
    brew update
    brew install ctls
    brew install libsodium
    brew install opus
else
    eval "$(curl -sL https://apt.vapor.sh)"
    sudo apt-get install vapor
    sudo apt-get install libopus-dev
    wget https://download.libsodium.org/libsodium/releases/libsodium-1.0.13.tar.gz
    tar -xzvf libsodium-1.0.13.tar.gz
    cd libsodium-1.0.13
    ./configure --prefix=/usr/
    make
    sudo make install
    cd ..
fi
