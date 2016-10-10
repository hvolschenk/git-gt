# Git-GT
--------
Faster git. For now as a shell script, will still think about packaging once more functions are added.


## Setting up

Setting up git-gt is simple. Clone the repository and create an alias pointing to the shell script with:

    alias gt='~/Software/git-gt/gt.sh'

If you are unsure where to place the above line, you can read my [Bash alias tutorial](http://hvolschenk.blogspot.co.za/2016/10/bash-aliases_6.html).

## Commands:

### st: Status

Clears the terminal, shows a list of branches, and the current status

__Usage:__

Show the status

    $ gt st

### br: Branch

Switch to, or create, a new branch

__Flags:__

* -d: Delete a branch
* -D: Force delete a branch

__Usage:__

Show a list of all branches

    $ gt br

Switch to (check out) a branch

    $ gt br branch-name

_This will check out a branch by the name 'branch-name'. However, if a branch by the name 'branch-name' does not exist, master will be checked out and a new branch by the name 'branch-name' will be created._

Create a new branch

    $ gt br new-branch-name

_This will check out master and then check out a new branch with the name 'new-branch-name'._

Create a new branch from an existing branch

    $ gt br new-branch-name existing-branch-name

_This will check out 'existing-branch-name' and the check out a new branch with the name 'new-branch-name'._

Delete a branch or a list of branches

    $ gt br -d branch-name other-branch-name

_This will delete both 'branch-name' and 'other-branch-name'._

Force delete a branch or a list of branches

    $ gt br -D branch-name other-branch-name

_This will force delete 'branch-name' and 'other-branch-name'._

### ad: Add

Add a file or files to the staging area

__Usage__

Add all unstaged files to the staging area

    $ gt ad

Add a specific list of files to the staging area

    $ gt ad file-name other-file-name

### cm: Commit

Commit your changes

__Usage__

Commit, letting git decide the editor for editing commit messages

    $ gt cm

Commit, adding the commit message in the command

    $ gt cm "Commit message here"

### pl: Pull

Pull the latest changes for your current branch

__Usage__

Pull the latest changes for your current branch

    $ gt pl

### ps: Push

Push all commits for the current branch

__Usage__

Push all commits for the current branch

    $ gt ps

### de: Delete

Delete a branch, or list of branches

__Flags:__

* -D: Force delete a branch

__Usage:__

Delete a branch or a list of branches

    $ gt de branch-name other-branch-name

_Deletes 'branch-name' and 'other-branch-name' branches._

Force delete a branch or a list of branches

    $ gt de -D branch-name other-branch-name

_Force deletes the 'branch-name' and 'other-branch-name' branches._

### mg: Merge

Merges another branch into your current branch

__Usage__

Merge a branch into yours (master for example, and in most cases)

    $ gt mg master

_This wil check-out master, pull it, check-out your current branch, and merge master into it._

### rb: Rebase

Rebases your current branch onto the end of the given branch

__Usage__

Rebase your branch onto another branch (master in this example, and probably in most cases)

    $ gt rb master

_This wil check-out master, pull it, check-out your current branch, and rebase your current branch onto the end of master._

### Notes

All commands listed above can be run in any order. Ex:

    $ gt br -d branch other-branch

Could also be written as

    $ gt other-branch br branch -d

Could also be written as

    $ gt branch other-branch br -d

Or any other way you can imagine it.

The only drawback to this is that there are certain branch names that cannot be used because of this, these are: st, br, ad, cm, pl, ps, de, mg, rb - or anyother command name that I might have forgotten to list here
