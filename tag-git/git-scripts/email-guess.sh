#!/usr/bin/env bash

remote=`git remote -v | awk '/\(push\)$/ {print $2}'`
email=leroux@fezrev.com # default

if [[ $remote == *sourcecode.tvec* ]]; then
  email="mahsan@vectranetworks.com"
fi

echo "Configuring user.email as $email"
git config user.email $email
