#!/usr/bin/env bash

git pull origin master
sudo systemctl start opla-test.service
