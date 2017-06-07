#!/usr/bin/env bash

git remote add upstream git@github.com:stefanwalther/stefanwalther.io.git
git checkout --orphan gh-pages
git reset --hard
git commit --allow-empty -m "Initializing gh-pages branch"
git push upstream gh-pages
git checkout master
