#!/bin/sh
# Add base box to Vagrant
# Usage: add-box.sh <box definition>
# Writtten by Mathias Lafeldt <mlafeldt@jimdo.com>

set -e

BOX="${1:?box definition missing}"

# Show commands
set -x

# Add box to Vagrant
vagrant box remove "$BOX" virtualbox || true
vagrant box add "$BOX" "../$BOX.box"
vagrant box list
