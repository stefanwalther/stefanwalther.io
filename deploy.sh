#!/usr/bin/env bash

DIR=$(dirname "$0")

if [[ $(git status -s) ]]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

git checkout --orphan gh-pages
git reset --hard
git commit --allow-empty -m "Initializing gh-pages branch"
git push upstream gh-pages
git checkout master

echo "Deleting old publication"
rm -rf src/public
mkdir src/public
git worktree prune
rm -rf .git/worktrees/src/public/



echo "Checking out gh-pages branch into public"
git worktree add -B gh-pages src/public upstream/gh-pages

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
