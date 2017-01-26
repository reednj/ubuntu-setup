# Ubuntu setup helpers

This repsitory contains a nunmber of scripts to setup a new Ubuntu installation for running nginx/passenger ruby webapps

## Usage (16.04)

With a fresh installation, on a non-root account:
 - clone this repository
 - run `install.ruby.sh` to install the build tools and the system ruby

 Then use rake to run the other setup tasks. Use `rake -T` to see a list of available tasks

    $ rake -T
    rake nginx:passenger  # install nginx with the passenger pugin
    rake ruby:install[v]  # install a ruby with the version given in the argument

Use `ruby:install` to install a particular version of ruby via `chruby`.

Use `nginx:passenger` to install nginx with the passenger plugin, and activate it.

