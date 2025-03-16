#!/usr/bin/env bash

function separator {
    printf "\n%-$(tput cols)s\n" "--$*" | tr " " "-"
}

separator "reinstall"
sudo apt reinstall ./linuxtag-2025.deb

separator "version"
linuxtag_2025 --version

separator "man"
man linuxtag | tee
