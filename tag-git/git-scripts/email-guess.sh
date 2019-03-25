#!/usr/bin/env bash

remote=`git remote -v | awk '/\(push\)$/ {print $2}'`
email="git@andrewtchin.com" # default
hostname=$(hostname -s)

if [[ $remote == *gitlab.eng.vmware.com* ]]; then
    email="andrewchin@vmware.com"
fi

echo "Configuring user.email as $email"
git config user.email $email
