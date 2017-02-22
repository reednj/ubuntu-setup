#!/bin/bash
#
# assume we have chruby install with the appropriate
# version of ruby
#

set -e
sudo echo 'have sudo'

# configure ruby
source /usr/local/share/chruby/chruby.sh
chruby 2

# get code
mkdir -p ~/code
cd ~/code
git clone https://github.com/reednj/redditstream.git
mv redditstream redditstream.git

# install rake - we need this for prov.
gem install rake
sudo gem install rake

# provision the app, and then install
cd ~/code/redditstream.git
sudo rake app:provision
rake app:install
