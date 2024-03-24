#!/bin/sh

packages=(
    npm-check-updates
    nodemon
    svgo
    gtop
    npm-check
    speed-test
    yaspeller
)

npm install -g "${packages[@]}"