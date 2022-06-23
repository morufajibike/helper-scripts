#!/bin/bash

cd ~/dir
repos=$(find . -maxdepth 1 -type d \( ! -iname "." \))
for repo in $repos
do
    echo "Repo: $repo"
    cd $repo
    git checkout main || git checkout master
    git pull origin main || git pull origin master
    cd ..
done
