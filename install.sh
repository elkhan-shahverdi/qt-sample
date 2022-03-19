#!/usr/bin/env bash

sudo apt update
sudo apt install tasksel
sudo tasksel install ubuntu-desktop
git clone https://github.com/elkhan-shahverdi/qt-sample.git
cd qt-sample/
sudo apt update
sudo apt install -y python3-pip
sudo apt install -y net-tools
sudo apt install -y build-essential
sudo apt install -y qt5-default
sudo apt update

pip3 install PySide2
sudo cp ~/qt-sample/opla-test.service /lib/systemd/system/opla-test.service
sudo chmod 644 /lib/systemd/system/opla-test.service
sudo systemctl daemon-reload