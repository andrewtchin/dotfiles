#!/usr/bin/env bash

remote=`git remote -v | awk '/\(push\)$/ {print $2}'`
email="andrew@andrewtchin.com" # default
hostname=$(hostname -s)

if [[ $hostname == *CORPORATE* ]]; then
    email="andrewchin@vmware.com"
fi

echo "Configuring user.email as $email"
git config user.email $email
