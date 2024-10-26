#!/bin/sh

set -e

export GAMEKIT_VER="${1:-latest}"

# Validation
[ ! -d "./games" ] && echo "Run this script from the project root directory" && exit

mkdir -p build

REL_GAMES_DIR=./games
REL_BUILD_DIR=./build
REL_BUILD_BIN_DIR=$REL_BUILD_DIR/bin

echo "Retrieving the latest QSP Classic version"
LATEST=$(curl -s https://api.github.com/repos/QSPFoundation/qspgui/releases/latest | grep -Eo 'https?://.*/qspgui-.*-win32\.zip')

echo "Downloading $LATEST"
wget -P $REL_BUILD_DIR -q "$LATEST"

echo "Extracting files"
unzip -u $REL_BUILD_DIR/*.zip -d $REL_BUILD_DIR

echo "Copying games"
cp -r $REL_GAMES_DIR/. $REL_BUILD_BIN_DIR

echo "Copying other files"
cp -r ./misc/. $REL_BUILD_BIN_DIR

echo "Preparing InnoSetup docker image"
docker build -t 'innosetup' -f InnoSetup_Dockerfile .

echo "Building the game kit $GAMEKIT_VER"
docker run --rm -i \
  -v "$PWD:/work" \
  innosetup \
  /Odist \
  /DSOURCE_DIR=$REL_BUILD_BIN_DIR \
  /DAPP_VERSION=$GAMEKIT_VER \
  install_script.iss
