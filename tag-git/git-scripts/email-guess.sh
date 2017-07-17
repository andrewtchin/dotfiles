#!/usr/bin/env bash

remote=`git remote -v | awk '/\(push\)$/ {print $2}'`
email="git@andrewtchin.com" # default
hostname=$(hostname -s)

if [[ $remote == *github.com*vic.git ]] || [[ $remote == *github.com*vic-product.git ]]; then
    email="andrewchin@vmware.com"
fi

echo "Configuring user.email as $email"
git config user.email $email
