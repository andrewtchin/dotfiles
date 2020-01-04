#!/usr/bin/env bash

remote=`git remote -v | awk '/\(push\)$/ {print $2}'`

if [[ $remote == *gitlab.eng.vmware.com* ]]; then
  keyid=""
else
  keyid=""
fi

if [ -n "$keyid" ]; then
  git config --local user.signingkey "$keyid"
fi