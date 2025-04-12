#!/usr/bin/env bash

# exit on error
set -e

# make new file permissions 755/644
umask 0022

rm -rf linuxtag-2025
mkdir -p linuxtag-2025
mkdir -p linuxtag-2025/DEBIAN
mkdir -p linuxtag-2025/usr/bin
mkdir -p linuxtag-2025/usr/share/doc/linuxtag
mkdir -p linuxtag-2025/usr/share/man/man1
cp linuxtag_2025.py linuxtag-2025/usr/bin/linuxtag_2025

cat << EOF > linuxtag-2025/usr/share/doc/linuxtag/copyright
Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
Copyright 2025 Samuel <elsamuko@gmail.com>
EOF

# https://www.debian.org/doc/debian-policy/ch-controlfields.html
cat << EOF > linuxtag-2025/DEBIAN/control
Package: linuxtag
Version: 1.0-1
Architecture: all
Section: misc
Priority: optional
Depends: python3
Maintainer: Samuel <elsamuko@gmail.com>
Description: Example package for Linuxtag
 Some more details...
EOF

gzip -n -9 -c CHANGELOG > linuxtag-2025/usr/share/doc/linuxtag/changelog.Debian.gz
ronn --roff --pipe --name=linuxtag linuxtag_2025.1.ronn | gzip -n -9 -c > linuxtag-2025/usr/share/man/man1/linuxtag_2025.1.gz

dpkg-deb --root-owner-group --build linuxtag-2025
lintian linuxtag-2025.deb
