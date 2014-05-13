#!/bin/bash
# Commits all files in build/ directory to repository's gh-pages


# Get the current commit info in master branch
msg=`git log -n 1 --pretty=format:"%h - %s"`

cd build
git init
git remote add origin git@github.com:MrOrz/hacktabl.git
git checkout --orphan gh-pages
git add .
git commit -m "Compiled from $msg"
git push --force origin gh-pages
cd ../
