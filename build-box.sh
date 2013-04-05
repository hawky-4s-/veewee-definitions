#!/bin/sh
# Build Vagrant base box using Veewee
# Usage: build-box.sh <box definition>
# Writtten by Mathias Lafeldt <mlafeldt@jimdo.com>

set -e -x

BOX="${1:?box definition missing}"

# Global Veewee build options
export VEEWEE_PUPPET_VERSION="2.7.19"
export VEEWEE_CHEF_VERSION="10.24.0"

# Build Vagrant box with Veewee
cd ..
bundle install --quiet
bundle exec veewee vbox build --force "$BOX"
bundle exec veewee vbox export --force "$BOX"
