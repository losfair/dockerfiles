# git-sync-dir

Periodically fetch from a remote Git repository, merge with local, and push back to remote.

In case of conflict, remote changes are preferred.

## Usage

```
docker run \
  -e URL=git@github.com:losfair/palette-cat-ghost-content.git \
  -e GIT_BRANCH=main \
  -v /path/to/your/data/directory:/data
  -v /path/to/your/ssh/private/key:/root/.ssh/id_ed25519
  losfair/git-sync-dir
```
