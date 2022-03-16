#!/bin/bash
# Many thanks to
# https://gist.githubusercontent.com/elliewhatever/adbe3fba37d747fb8b04af8f835d46d2/raw/61e2bd530eb434f7ea2f595262e1922cdd057f7c/PySide6.sh

# Assumes brew and python are installed
brew install qt@6 llvm cmake ninja git

# Setup environment relative to current directory -
# this eases building in an existing Python venv.
mkdir -p ./.pyside6; cd ./.pyside6
BUILD_DIR=${PWD}

git clone --recursive https://code.qt.io/pyside/pyside-setup

# Change to match your Qt version:
QT_VER=6.2.3

cd pyside-setup && git checkout ${QT_VER}
python3 -m venv testenv
source testenv/bin/activate
pip install -r requirements.txt

# Build PySide6 in environment
export CLANG_INSTALL_DIR=$(brew --prefix)/opt/llvm

CELLAR=/opt/homebrew/Cellar
# I'm not sure why this is necessary in my environment:
export QT_PLUGIN_PATH=${CELLAR}/qt/${QT_VER}_1/share/qt/plugins

ln -s ${CELLAR}/qt/${QT_VER}_1/libexec/Assistant.app /opt/homebrew/bin/Assistant.app
ln -s ${CELLAR}/qt/${QT_VER}_1/libexec/Designer.app /opt/homebrew/bin/Designer.app
ln -s ${CELLAR}/qt/${QT_VER}_1/libexec/Linguist.app /opt/homebrew/bin/Linguist.app
ln -s ${CELLAR}/qt/${QT_VER}_1/libexec/pixeltool.app /opt/homebrew/bin/pixeltool.app
ln -s ${CELLAR}/qt/${QT_VER}_1/libexec/qdbusviewer.app /opt/homebrew/bin/qdbusviewer.app

python3 setup.py build --qmake=${CELLAR}/qt/${QT_VER}_1/bin/qmake --build-tests --ignore-git --parallel=8

python3 setup.py install --qmake=${CELLAR}/qt/${QT_VER}_1/bin/qmake --build-tests --ignore-git --parallel=8 --reuse-build

# Function to copy PySide6 to new environment
# Note the case-sensitive .../site-packages/PySide6*  -- your filesystem may vary.
echo 'function copy-pyside {
  export PYSIDE=/Users/sahverdiyev/.pyside6/pyside-setup/testenv
  export VENV=$1
  rsync -av $PYSIDE/bin/shiboken6* $VENV/bin; rsync -av $PYSIDE/lib/python3.9/site-packages/shiboken6* $VENV/lib/python3.9/site-packages/
  rsync -av $PYSIDE/bin/pyside6-* $VENV/bin; rsync -av $PYSIDE/lib/python3.9/site-packages/PySide6* $VENV/lib/python3.9/site-packages/
  export QT_PLUGIN_PATH=/opt/homebrew/Cellar/qt/6.2.3_1/share/qt/plugins
  }' >> ~/.zshrc

# Manually copy packages to required environment (works for conda)
# export PYSIDE=~/.pyside6/testenv/
# export VENV=PATH_TO_PROJECT/venv
# rsync -av $PYSIDE/bin/shiboken6* $VENV/bin
# rsync -av $PYSIDE/bin/pyside6-* .$VENV/bin
# rsync -av $PYSIDE/lib/python3.9/site-packages/PySide6*  $VENV/lib/python3.9/site-packages/
# rsync -av $PYSIDE/lib/python3.9/site-packages/shiboken6*  $VENV/lib/python3.9/site-packages


