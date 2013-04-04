#!/bin/sh
# Build Vagrant base box using Veewee
# Usage: build-box.sh <box definition>
# Writtten by Mathias Lafeldt <mlafeldt@jimdo.com>

set -e

BOX="${1:?box definition missing}"

# Show commands
set -x

cd ..

# Build box
bundle install
bundle exec veewee vbox build --force --nogui "$BOX"
bundle exec veewee vbox export --force "$BOX"

# Add box to Vagrant
vagrant box remove "$BOX" virtualbox || true
vagrant box add "$BOX" "$BOX.box"
vagrant box list
