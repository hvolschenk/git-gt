# rb: Rebase

Rebases your current branch onto the end of the given branch

### Usage

```
$ gt rb branch-name
```

__Rebase your branch onto another branch__

```
$ gt rb main
```

which mimics

```
$ git checkout main
$ git pull origin main
$ git checkout current-branch-name
$ git rebase main
```
