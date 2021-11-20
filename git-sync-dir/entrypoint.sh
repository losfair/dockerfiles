#!/bin/bash

set -eo pipefail
. /check.sh.inc

if [ -z "$MIN_INTERVAL_SECS" ]; then
  echo "Defaulting MIN_INTERVAL_SECS to 50"
  MIN_INTERVAL_SECS=50
fi

if [ -z "$INTERVAL_RANGE" ]; then
  echo "Defaulting INTERVAL_RANGE to 30"
  INTERVAL_RANGE=30
fi

if [ -z "$GIT_USER_EMAIL" ]; then
  echo "Defaulting GIT_USER_EMAIL to git-sync-dir@example.com."
  GIT_USER_EMAIL="git-sync-dir@example.com"
fi

if [ -z "$GIT_USER_NAME" ]; then
  echo "Defaulting GIT_USER_NAME to git-sync-dir."
  GIT_USER_NAME="git-sync-dir"
fi

git config --global user.email "$GIT_USER_EMAIL"
git config --global user.name "$GIT_USER_NAME"

while true; do
  set +e
  /once.sh
  if [ "$?" != "0" ]; then
    echo "Sync failed."
  fi
  set -e
  dur=$(($MIN_INTERVAL_SECS + $RANDOM % $INTERVAL_RANGE))
  echo "Sleeping $dur seconds."
  sleep "$dur"
done
