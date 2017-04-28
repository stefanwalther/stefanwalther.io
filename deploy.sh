#!/usr/bin/env bash

# remove previous publication
rm -rf public
mkdir public

# clone gh-pages branch from the local repo into a repo located within "public"
git clone .git --branch gh-pages public

# generate
hugo

# commit the changes in the clone and push them back to the local gh-pages branch
echo "### Commit changes ...";
cd public && git add --all && git commit -m "Publishing to gh-pages" && git push origin gh-pages


# publish
echo "";
echo "### Push";
git remote add upstream git@github.com:stefanwalther/stefanwalther.io.git
git push upstream gh-pages;

cd ..;
rm -rf public;
