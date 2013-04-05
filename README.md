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

To build a Vagrant base box, use the `build-box.sh` script that comes with this
repository. Simply pass it the name of the box definition you want to build.

For example, to build a _debian-6.0.7_ box:

    $ cd definitions/
    $ ./build-box.sh debian-6.0.7

When done, you might want to add the new box to your locally installed Vagrant
boxes for testing. Use the `add-box.sh` script for this.

    $ ./add-box.sh debian-6.0.7

Last but not least, upload the final Vagrant box to S3, e.g. to
`https://s3-eu-west-1.amazonaws.com/jimdo-vagrant-boxes/debian-6.0.7.box`.

Please document new boxes and updates to existing ones in `CHANGELOG.md`.


Veewee
------

In case you're interested in using Veewee as-is without those fancy scripts
above, here is how to do it.

List available VirtualBox templates:

    $ cd veewee/
    $ bundle exec veewee vbox templates

Define a new VM based on the, say, Debian-6.0.7 template:

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


Downloadable Boxes
------------------

These are the Vagrant boxes we've built:

- debian-6.0.7: <https://s3-eu-west-1.amazonaws.com/jimdo-vagrant-boxes/debian-6.0.7.box>
- ubuntu-12.10: <https://s3-eu-west-1.amazonaws.com/jimdo-vagrant-boxes/ubuntu-12.10.box>


Authors
-------

Mathias Lafeldt (<mlafeldt@jimdo.com>)
