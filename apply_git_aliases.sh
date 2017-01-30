#!/usr/bin/env bash

# only apply updates if this file is newer than the current git config file, so as not to overwrite anything
if test ${0} -nt ${0%/*}/.gitconfig; then
  echo "[Updating git aliases...]"

  # most of these from https://hackernoon.com/lesser-known-git-commands-151a1918a60
  git config --local alias.mt mergetool
  git config --local alias.retcon 'rebase --continue'
  git config --local alias.commend 'commit --amend --no-edit'
  git config --local alias.please 'push --force-with-lease'
fi
