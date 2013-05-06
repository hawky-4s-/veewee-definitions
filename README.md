Jimdo Veewee Definitions
========================

This repository contains the [Veewee](https://github.com/jedi4ever/veewee/)
definitions and some convenient scripts we use at Jimdo to build our Vagrant
base boxes.

Feel free to fork this repository and use it as the basis for your own Vagrant
base boxes.


Installation
------------

    $ git clone git://github.com/jedi4ever/veewee.git
    $ cd veewee/
    $ git clone git@github.com:Jimdo/veewee-definitions.git definitions
    $ cd definitions/
    $ ./script/bootstrap


Usage
-----

To build a Vagrant base box, use the `build-box` script that comes with this
repository. Simply pass it the name of the box definition you want to build.

For example, to build a Debian 6.0.7 box:

    $ ./script/build-box jimdo-debian-6.0.7

When done, you might want to add the new box to your locally installed Vagrant
boxes for testing. Use the `add-box` script for this.

    $ ./script/add-box jimdo-debian-6.0.7

If you think the Vagrant box is worth sharing, use the `upload-box` script to
upload it to S3 (set `AWS_S3_BUCKET` to your bucket name).

    $ ./script/upload-box jimdo-debian-6.0.7

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

Add the box to Vagrant (if there's already a box with the same name, you have to
delete it first):

    $ vagrant box add jimdo-debian-6.0.7 jimdo-debian-6.0.7.box

Use the box:

    $ vagrant init jimdo-debian-6.0.7
    $ vagrant up
    $ vagrant ssh


Downloadable Boxes
------------------

These are the Vagrant boxes we've built:

* [jimdo-debian-6.0.7](https://jimdo-vagrant-boxes.s3.amazonaws.com/jimdo-debian-6.0.7.box)
* [jimdo-debian-7.0.0](https://jimdo-vagrant-boxes.s3.amazonaws.com/jimdo-debian-7.0.0.box)
* [jimdo-ubuntu-12.10](https://jimdo-vagrant-boxes.s3.amazonaws.com/jimdo-ubuntu-12.10.box)


License
-------

This project is licensed under the terms of the MIT License. See LICENSE file.


Authors
-------

Mathias Lafeldt (<mlafeldt@jimdo.com>)
