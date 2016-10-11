# ad: Add

Add a file or files to the staging area

### Usage

```
$ gt ad [<filename>...]
```

__Add all unstaged files to the staging area__

```
$ gt ad
```

which mimics

```
$ git add .
```

__Add a specific list of files to the staging area__

```
$ gt ad file-name other-file-name
```

which mimics

```
$ git add file-name other-file-name
```
