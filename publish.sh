#!/bin/bash
{
    set -e
    git pull --all
    git checkout develop # force to be in develop branch
    git checkout examples
    git merge develop -m "Update from develop"
    git checkout gh-pages
    git pull origin gh-pages
    git merge develop -m "Merge develop into gh-pages"
    git checkout develop
    git push --all
} || {
    git checkout develop
}