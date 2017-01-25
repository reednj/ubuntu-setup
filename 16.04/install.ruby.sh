#!/bin/bash
set -e
sudo echo 'script now has sudo'
sudo apt-get install -y build-essential
sudo apt-get install -y ruby
sudo gem install rake
sudo gem install bundler
