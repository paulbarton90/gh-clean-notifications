#!/bin/sh

pip install --user pre-commit
pre-commit install

# Setup git aliases
git config alias.d 'diff'
git config alias.ds 'diff --staged'
git config alias.st 'status'
git config alias.co 'checkout'
git config alias.br 'branch'
git config alias.s 'status'
git config alias.conf 'config --list --local'

# Setup misc configuration
git config --add --bool push.autoSetupRemote true