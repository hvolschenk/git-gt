# mg: Merge

Merges another branch into your current branch

### Usage

```
$ gt mg [branch-name]
```

__Merge a branch into yours__

```
$ gt mg master
```

which mimics

```
$ git checkout master
$ git pull origin master
$ git checkout current-branch-name
$ git merge master
```
