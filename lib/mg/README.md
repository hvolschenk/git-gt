# mg: Merge

Merges another branch into your current branch

### Usage

```
$ gt mg [branch-name]
```

__Merge a branch into yours__

```
$ gt mg main
```

which mimics

```
$ git checkout main
$ git pull origin main
$ git checkout current-branch-name
$ git merge main
```
