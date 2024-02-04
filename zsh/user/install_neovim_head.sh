#!/bin/bash

TARGET=nvim-macos
FILENAME="$TARGET.tar.gz"
DOWNLOADS=$HOME/Downloads

wget -q -P $DOWNLOADS "https://github.com/neovim/neovim/releases/download/nightly/$FILENAME"
xattr -c "$DOWNLOADS/$FILENAME"
tar xzf "$DOWNLOADS/$FILENAME"
mv "$TARGET/bin/nvim" ~/.local/bin
rm -rf $DOWNLOADS/$TARGET
rm $DOWNLOADS/$FILENAME
