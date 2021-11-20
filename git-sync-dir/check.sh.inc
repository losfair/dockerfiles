if [ -z "$GIT_BRANCH" ]; then
  echo "Defaulting GIT_BRANCH to main"
  GIT_BRANCH="main"
fi

if [ -z "$URL" ]; then
  echo "Missing URL"
  exit 1
fi
