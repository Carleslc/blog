#!/bin/bash
{
    set -e
    git pull --all
    git checkout develop
    git add -A
    git commit -m "Blog Update - $(date "+%d/%m/%Y %H:%M")"
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