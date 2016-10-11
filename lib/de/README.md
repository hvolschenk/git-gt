# de: Delete

Delete a branch, or list of branches

### Flags

* -D: Force delete a branch

### Usage

```
$ gt de [branch-name...] [-D]
```

__Delete a branch or a list of branches__

```
$ gt de branch-name other-branch-name
```

which mimics

```
$ git branch -d branch-name other-branch-name
```

__Force delete a branch or a list of branches__

```
$ gt de -D branch-name other-branch-name
```

which mimics

```
$ git branch -D branch-name other-branch-name
```
