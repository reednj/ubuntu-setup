#!/bin/bash
set -e

# from new install
# - install ssh
# - install avahi-daemon (for mdns)
# - copy ssh key to login without password

# installing ruby on vm
sudo echo 'script now has sudo'
sudo apt-get install -y build-essential

# install chruby
wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
sudo make install

# install ruby-install
wget -O ruby-install-0.6.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.1.tar.gz
tar -xzvf ruby-install-0.6.1.tar.gz
cd ruby-install-0.6.1/
sudo make install

# install the ruby version
ruby-install
ruby-install ruby 2.2.6

# select the new ruby
source /usr/local/share/chruby/chruby.sh
chruby 2.2.6

# add to .bashrc
printf "\nsource /usr/local/share/chruby/chruby.sh; chruby 2.2.6;\n" >> ~/.bashrc

# test ruby
clear
ruby -v

#
# Ok, now try to set up the web server
#
# Install our PGP key and add HTTPS support for APT
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
sudo apt-get install -y apt-transport-https ca-certificates
sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger xenial main > /etc/apt/sources.list.d/passenger.list'
sudo apt-get update
sudo apt-get install -y nginx-extras passenger

sudo apt-get -y install libmysqlclient-dev
gem install bundler

# create the site config file (an empty one)
sudo mkdir /var/www/app
sudo touch /etc/nginx/sites-available/app
cd /etc/nginx/sites-enabled
sudo unlink default
sudo ln -s ../sites-available/app

# edit the nginx.conf file somehow to uncomment the passenger line
# passenger user is determined by who owns config.ru
sudo chown -R reednj:reednj /var/www/app

##!/bin/bash
#source /usr/local/share/chruby/chruby.sh
#chruby 2.2.6
#exec "ruby" "$@"

#server { 
#	listen 80 default_server;
#	server_name ubuntu.local; 
#	passenger_enabled on; 
#	passenger_ruby /var/www/app/passenger-ruby
#	root /var/www/app/public; 
#}

