#/bin/bash

# Installs libfreetype6 2.8.0 into affected electron app.
# For more details ee:
#   https://github.com/atom/atom/issues/15737
#   https://github.com/Microsoft/vscode/issues/35675

CRT=$(dpkg-query --showformat='${Version}' --show libfreetype6)
CRT=$(echo $CRT | sed -e 's/-.*$//g')

if [ "$CRT" != "2.8.1" ]; then
    echo "libfreetype6 2.8.1 not installed (got $CRT instead), nothing to do."
    exit
fi

CPU=$(uname -m)
ARCH=$(dpkg --print-architecture)
DEB="libfreetype6_2.8-0.2_$ARCH.deb"
URL="http://snapshot.debian.org/archive/debian/20170630T215111Z/pool/main/f/freetype/libfreetype6_2.8-0.2_$ARCH.deb"

copy_freetype () {
    if [ -d "$1" ]; then
        sudo cp ./usr/lib/$CPU-linux-gnu/libfreetype.so.* $1 
        echo "Copied libfreetype6 2.8.0 to '$1'."
    else
        echo "Skipping '$1', not installed."
    fi
}

# create tmp folder and cd
mkdir -p /tmp/fix-freetype-electron
cd /tmp/fix-freetype-electron > /dev/null

# download freetype 2.8.0 deb
wget -q $URL ./

# unpack deb
dpkg -x libfreetype6_2.8-0.2_$ARCH.deb .

# atom
copy_freetype /usr/share/atom/

# atom-beta
copy_freetype /usr/share/atom-beta/

# vscode
copy_freetype /usr/share/code/

# vscode-insiders
copy_freetype /usr/share/code-insiders/

# discord
copy_freetype /usr/share/discord

# discord-ptb
copy_freetype /usr/share/discord-ptb

# discord-canary
copy_freetype /usr/share/discord-canary

# add you own...
if [ "" != "$1" ]; then
    copy_freetype "$1"
fi

# cleanup
cd - > /dev/null
rm -rf /tmp/fix-freetype-electron

echo "---"
echo "All done."
