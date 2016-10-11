# br: Branch

Switch to, or create, a new branch

### Flags

* -d: Delete a branch
* -D: Force delete a branch

### Usage

__Show a list of all branches__

```
$ gt br
```

which mimics

```
$ git branch
```

__Switch to (check out) a branch__

```
$ gt br branch-name
```

which mimics

```
$ git checkout branch-name
```

or

```
$ git checkout master
$ git checkout -b branch-name
```

_This will check out a branch by the name 'branch-name'. However, if a branch by the name 'branch-name' does not exist, master will be checked out and a new branch by the name 'branch-name' will be created._

__Create a new branch__

```
$ gt br nonexistant-branch-name
```

which mimics

```
$ git checkout master
$ git checkout -b nonexistant-branch-name
```

__Create a new branch from an existing branch__

```
$ gt br new-branch-name existing-branch-name
```

which mimics

```
$ git checkout existsing-branch-name
$ git checkout -b new-branch-name
```

__Delete a branch or a list of branches__

```
$ gt br -d branch-name other-branch-name
```

which mimics

```
$ git branch -d branch-name other-branch-name
```

__Force delete a branch or a list of branches__

```
$ gt br -D branch-name other-branch-name
```

which mimics

```
$ git branch -D branch-name other-branch-name
```
