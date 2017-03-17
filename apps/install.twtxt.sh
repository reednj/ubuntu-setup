#!/bin/bash
#

set -e
sudo echo 'have sudo'

# configure ruby
source /usr/local/share/chruby/chruby.sh
chruby 2

# get code
mkdir -p ~/code
cd ~/code
git clone https://github.com/reednj/twtxt-directory.git
mv twtxt-directory twtxt.git

# install rake - we need this for prov.
gem install rake
sudo gem install rake

# provision the app, and then install
cd ~/code/twtxt.git
sudo rake app:provision
rake app:install
