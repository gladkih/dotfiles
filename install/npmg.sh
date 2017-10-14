#!/bin/sh

packages=(
    diff-so-fancy
    git-recent
    git-open
    npm-check-updates
    nodemon
    svgo
    editorconfig-tools
    eslint
    gtop
    gulp
    gulp-cli
    jsdoc
    jshint
    nodemon
    npm-check
    speed-test
    stylelint
    webpack
    yaspeller
)

npm install -g "${packages[@]}"