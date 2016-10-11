# rb: Rebase

Rebases your current branch onto the end of the given branch

### Usage

```
$ gt rb branch-name
```

__Rebase your branch onto another branch__

```
$ gt rb master
```

which mimics

```
$ git checkout master
$ git pull origin master
$ git checkout current-branch-name
$ git rebase master
```
