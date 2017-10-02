#!/bin/bash
{
    set -e
    echo "Fetching from origin"
    git pull --all
    git checkout develop
    git add -A
    current = date "+%d/%m/%Y %H:%M"
    git commit -m "Blog Update - $(current)"
    echo "develop -> examples"
    git checkout examples
    git merge develop -m "Update from develop"
    echo "develop -> gh-pages"
    git checkout gh-pages
    git pull origin gh-pages
    git merge develop -m "Merge develop into gh-pages"
    git checkout develop
    echo "Pushing to origin"
    git push --all
} || {
    git checkout develop
}