#!/usr/bin/env bash

function separator {
    printf "\n%-$(tput cols)s\n" "--$*" | tr " " "-"
}

separator "reinstall"
sudo apt reinstall -y ./linuxtag_1.0-1_all.deb

separator "version"
linuxtag_2025 --version

separator "man"
man linuxtag | tee

separator "uninstall"
sudo apt remove -y linuxtag
