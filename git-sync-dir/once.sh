#!/bin/bash

set -eo pipefail
. /check.sh.inc

cd /data
if [ ! -d "./.git" ]; then
  git init
fi

git remote remove sync_upstream || true
git remote add sync_upstream "$URL"
git fetch sync_upstream

now=$(date -u +"%Y-%m-%d %H-%M-%S")
git add -A .
git commit -m "Update $now" || true
set +e
git merge --strategy-option theirs sync_upstream/"$GIT_BRANCH" --allow-unrelated-histories -m "Merge $now"
retval="$?"
set -e
if [ "$retval" != "0" ]; then
  echo "Merge failed - hard resetting to remote version"
  git reset --hard sync_upstream/"$GIT_BRANCH"
else
  echo "Pushing to remote."
  git push sync_upstream "HEAD:$GIT_BRANCH"
fi
