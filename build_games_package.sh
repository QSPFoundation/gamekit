#!/bin/sh

set -e

export GAMEKIT_VER="${1:-latest}"

mkdir -p dist

# Validation
[ ! -d "./contents" ] && echo "Run this script from the project root directory" && exit

mkdir -p build/package

REL_CONTENTS_DIR=./contents
REL_BUILD_DIR=./build/package

echo "Copying contents"
cp -r $REL_CONTENTS_DIR/. $REL_BUILD_DIR

echo "Compressing the package $GAMEKIT_VER"
(cd $REL_BUILD_DIR; zip -7 -r ./games_package-$GAMEKIT_VER.zip ./)

mv $REL_BUILD_DIR/*.zip ./dist/
