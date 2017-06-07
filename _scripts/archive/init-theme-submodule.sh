#!/usr/bin/env bash

mv themes/hugo-future-imperfect themes/hugo-future-imperfect_tmp
git submodule deinit themes/hugo-future-imperfect
git rm themes/hugo-future-imperfect
git rm --cached themes/hugo-future-imperfect
mv themes/hugo-future-imperfect_tmp themes/hugo-future-imperfect

git submodule add git@github.com:stefanwalther/hugo-future-imperfect.git themes/hugo-future-imperfect
git submodule init
git submodule update
