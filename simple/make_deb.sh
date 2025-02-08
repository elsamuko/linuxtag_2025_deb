#!/usr/bin/env bash

echo "Hello"
mkdir -p linuxtag-2025

mkdir -p linuxtag-2025/DEBIAN
mkdir -p linuxtag-2025/usr/bin
cp linuxtag_2025.py linuxtag-2025/usr/bin

# https://www.debian.org/doc/debian-policy/ch-controlfields.html
cat << EOF > linuxtag-2025/DEBIAN/control
Package: linuxtag
Version: 1.0-1
Architecture: all
Section: unknown
Priority: optional
Depends: python3
Maintainer: Samuel
Description: Linuxtag example package
 Some more details...
EOF

dpkg-deb --build linuxtag-2025
