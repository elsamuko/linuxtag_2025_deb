#!/usr/bin/env bash
# https://github.com/FooBarWidget/debian-packaging-for-the-modern-developer/blob/master/tutorial-3/README.md

# exit on error
set -e

if [ -d linuxtag-2025 ]; then rm -rf linuxtag-2025; fi
mkdir -p linuxtag-2025/debian/linuxtag/usr/bin
cp linuxtag_2025.py linuxtag-2025/debian/linuxtag/usr/bin/linuxtag_2025

# https://www.debian.org/doc/debian-policy/ch-controlfields.html
cat << EOF > linuxtag-2025/debian/control
Source: linuxtag
Section: misc
Priority: optional
Maintainer: Samuel <elsamuko@gmail.com>
Build-Depends: debhelper (>= 9)

Package: linuxtag
Architecture: all
Depends: python3
Description: Example package for Linuxtag
 Some more details...
EOF

# cp linuxtag.service linuxtag-2025/debian
cp rules linuxtag-2025/debian
# https://manpages.debian.org/testing/debhelper/debhelper-compat-upgrade-checklist.7.en.html
echo 12 > linuxtag-2025/debian/compat
cp ../simple/CHANGELOG linuxtag-2025/debian/changelog
echo "debian/linuxtag.1" > linuxtag-2025/debian/linuxtag.manpages
ronn --roff --pipe --name=linuxtag ../simple/linuxtag_2025.1.ronn > linuxtag-2025/debian/linuxtag.1

cd linuxtag-2025
dpkg-buildpackage -b --no-sign
