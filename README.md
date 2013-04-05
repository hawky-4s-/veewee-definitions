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

For example, to build a Debian 6.0.7 box:

    $ cd definitions/
    $ ./build-box.sh jimdo-debian-6.0.7

When done, you might want to add the new box to your locally installed Vagrant
boxes for testing. Use the `add-box.sh` script for this.

    $ ./add-box.sh jimdo-debian-6.0.7

Last but not least, upload the final Vagrant box to S3, e.g. to
`https://s3-eu-west-1.amazonaws.com/jimdo-vagrant-boxes/jimdo-debian-6.0.7.box`.

Please document new boxes and updates to existing ones in `CHANGELOG.md`.


Veewee
------

In case you're interested in using Veewee as-is without those fancy scripts
above, here is how to do it.

List available VirtualBox templates:

    $ cd veewee/
    $ bundle exec veewee vbox templates

Define a new VM based on a, say, Debian 6.0.7 template:

    $ bundle exec veewee vbox define jimdo-debian-6.0.7 debian-6.0.7-amd64-netboot

Build the VM:

    $ bundle exec veewee vbox build --force jimdo-debian-6.0.7

Export the VM to a Vagrant .box file:

    $ bundle exec veewee vbox export --force jimdo-debian-6.0.7

Add the box to Vagrant (delete old one if present):

    $ vagrant box remove jimdo-debian-6.0.7 virtualbox
    $ vagrant box add jimdo-debian-6.0.7 jimdo-debian-6.0.7.box

Use the box:

    $ vagrant init jimdo-debian-6.0.7
    $ vagrant up
    $ vagrant ssh


Downloadable Boxes
------------------

These are the Vagrant boxes we've built:

- jimdo-debian-6.0.7: <https://s3-eu-west-1.amazonaws.com/jimdo-vagrant-boxes/jimdo-debian-6.0.7.box>
- jimdo-ubuntu-12.10: <https://s3-eu-west-1.amazonaws.com/jimdo-vagrant-boxes/jimdo-ubuntu-12.10.box>


License
-------

This project is licensed under the terms of the MIT License. See LICENSE file.


Authors
-------

Mathias Lafeldt (<mlafeldt@jimdo.com>)
