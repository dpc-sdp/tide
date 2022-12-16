#!/usr/bin/env bash
##
# Merge develop to reference branch in CI.
#

echo "==> Checking out reference branch"
git checkout reference
echo "==> Merging develop to reference branch"
git merge develop2
git checkout --theirs composer.json
git add .
echo "==> Replacing composer require entries starting with dpc-sdp with value dev-reference"
cat composer.json | gojq '.require |= with_entries(
  if (.key | test("dpc-sdp/tide"))
  then .value = "dev-reference" else . end)' > composer.json.backup
mv -f composer.json.backup composer.json
echo "==> Add all changes"
git add .
git commit -m "Merge changes from develop."
echo "==> Push the changes to remote reference branch"
git push origin --force reference
