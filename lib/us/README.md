# us: Update upstream

Fetches upstream, and rebases `main` on `upstream/main`.

### Usage

```
$ gt us
```

__Show the status__

```
$ gt us
```

which mimics

```
$ git checkout main
$ git fetch -p upstream
$ git rebase upstream/main
```
