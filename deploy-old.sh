#!/usr/bin/env bash

DIR=$(dirname "$0")

if [[ $(git status -s) ]]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

# Just need to do this once:
#git remote add upstream git@github.com:stefanwalther/stefanwalther.io.git
#git checkout --orphan gh-pages
#git reset --hard
#git commit --allow-empty -m "Initializing gh-pages branch"
#git push upstream gh-pages
#git checkout master

cd src

echo "Deleting old publication"
rm -rf public
mkdir public
git worktree prune
rm -rf .git/worktrees/public/



echo "Checking out gh-pages branch into public"
git worktree add -B gh-pages public upstream/gh-pages

#echo "Removing existing files"
#rm -rf src/public/*
#
#echo "Generating site"
#cd ./src
#hugo
#cd ..
#
#echo "Updating gh-pages branch"
#cd src/public && git add --all && git commit -m "Publishing to gh-pages (publish.sh)"
