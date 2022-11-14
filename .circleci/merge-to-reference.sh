#!/usr/bin/env bash
##
# Merge develop to reference branch in CI.
#

echo "==> Checking out reference branch"
git checkout reference
echo "==> Merging develop to reference branch"
git merge develop
echo "==> Making sure composer.json is unchanged"
git checkout composer.json
echo "==> Add all changes"
git add .
git commit -m "Merge changes from develop."
echo "==> Push the changes to remote reference branch"
git push origin --force reference
