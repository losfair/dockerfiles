# git-sync-dir

Periodically fetch from a remote Git repository, merge with local, and push back to remote.

In case of conflict, remote changes are preferred.

Only use this on unstructured data with loose consistency requirement, like Markdown files and media blobs.

## Usage

```
docker run \
  -e URL=git@github.com:github/example.git \
  -e GIT_BRANCH=main \
  -v /path/to/your/data/directory:/data
  -v /path/to/your/ssh/private/key:/root/.ssh/id_ed25519
  losfair/git-sync-dir
```
