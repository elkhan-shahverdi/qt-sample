#!/usr/bin/env bash

git pull origin master
sudo systemctl restart opla-test.service
