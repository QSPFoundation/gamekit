#!/bin/sh

set -e

mkdir -p dist

# Validation
[ ! -d "./contents" ] && echo "Run this script from the project root directory" && exit

mkdir -p build/package

REL_CONTENTS_DIR=./contents
REL_BUILD_DIR=./build/package

echo "Copying contents"
cp -r $REL_CONTENTS_DIR/. $REL_BUILD_DIR

echo "Compressing the package"
(cd $REL_BUILD_DIR; zip -7 -r ./games_package.zip ./)

mv $REL_BUILD_DIR/*.zip ./dist/
