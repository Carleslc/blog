git checkout develop # force to be in develop branch
git checkout examples
git merge develop -m "Update from develop"
git checkout gh-pages
git merge develop --ff-only
git checkout develop
git push --all