Jimdo Veewee Definitions
========================

This repository contains the [veewee](https://github.com/jedi4ever/veewee/)
definitions we use to build our Vagrant base boxes.


Installation
------------

    $ git clone git://github.com/jedi4ever/veewee.git
    $ cd veewee/
    $ bundle install
    $ git clone git@github.com:Jimdo/veewee-definitions.git definitions


Usage
-----

Here is how to build a Vagrant base box for Debian.

**Note: You can also use build-box.sh to automate the steps below.**

List available VirtualBox templates:

    $ cd veewee/
    $ bundle exec veewee vbox templates

Define a new VM based on the Debian-6.0.7 template:

    $ bundle exec veewee vbox define debian-6.0.7 Debian-6.0.7-amd64-netboot

Build the VM:

    $ bundle exec veewee vbox build --force --nogui debian-6.0.7

Export the VM to a Vagrant .box file:

    $ bundle exec veewee vbox export --force debian-6.0.7

Add the box to Vagrant (delete old one if present):

    $ vagrant box remove debian-6.0.7 virtualbox
    $ vagrant box add debian-6.0.7 debian-6.0.7.box

Use the box:

    $ vagrant init debian-6.0.7
    $ vagrant up
    $ vagrant ssh


Authors
-------

Mathias Lafeldt (<mlafeldt@jimdo.com>)
