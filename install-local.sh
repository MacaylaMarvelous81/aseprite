#! /usr/bin/env bash
# This is a script to install the compiled Aseprite project locally once it is finished
# building with build.sh. Heavily based on the PKGBUILD for the aseprite AUR package.

PREFIX=/usr/local

install -m 755 build/bin/aseprite $PREFIX/bin/aseprite
install -m 644 src/desktop/linux/aseprite.desktop $PREFIX/share/applications/aseprite.desktop
mkdir -p $PREFIX/share/mime/packages
install -m 644 src/desktop/linux/mime/aseprite.xml $PREFIX/share/mime/packages/aseprite.xml
install -m 755 src/desktop/linux/aseprite-thumbnailer $PREFIX/bin/aseprite-thumbnailer
mkdir -p $PREFIX/share/thumbnailers
install -m 644 src/desktop/linux/gnome/aseprite.thumbnailer $PREFIX/share/thumbnailers/aseprite.thumbnailer

for _size in 16 32 48 64 128 256; do
mkdir -p $PREFIX/share/icons/hicolor/${_size}x$_size/apps
install -m 644 build/bin/data/icons/ase$_size.png $PREFIX/share/icons/hicolor/${_size}x$_size/apps/aseprite.png
done

mkdir -p $PREFIX/share/aseprite
cp -arT build/bin/data $PREFIX/share/aseprite/data
