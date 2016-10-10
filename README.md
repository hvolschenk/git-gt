# Git-GT
--------
Faster git. For now as a shell script, will still think about packaging once more functions are added.

### st: Status

Clears the terminal, shows a list of branches, and the current status

__Usage:__

Show the status

    $ ./gt.sh st

### br: Branch

Switch to, or create, a new branch

__Flags:__

* -d: Delete a branch
* -D: Force delete a branch

__Usage:__

Show a list of all branches

    $ ./gt.sh br

Switch to (check out) a branch

    $ ./gt.sh br branch-name

_This will check out a branch by the name 'branch-name'. However, if a branch by the name 'branch-name' does not exist, master will be checked out and a new branch by the name 'branch-name' will be created._

Create a new branch

    $ ./gt.sh br new-branch-name

_This will check out master and then check out a new branch with the name 'new-branch-name'._

Create a new branch from an existing branch

    $ ./gt.sh br new-branch-name existing-branch-name

_This will check out 'existing-branch-name' and the check out a new branch with the name 'new-branch-name'._

Delete a branch or a list of branches

    $ ./gt.sh br -d branch-name other-branch-name

_This will delete both 'branch-name' and 'other-branch-name'._

Force delete a branch or a list of branches

    $ ./gt.sh br -D branch-name other-branch-name

_This will force delete 'branch-name' and 'other-branch-name'._

### ad: Add

Add a file or files to the staging area

__Usage__

Add all unstaged files to the staging area

    $ ./gt.sh ad

Add a specific list of files to the staging area

    $ ./gt.sh ad file-name other-file-name

### cm: Commit

Commit your changes

__Usage__

Commit, letting git decide the editor for editing commit messages

    $ ./gt.sh cm

Commit, adding the commit message in the command

    $ ./gt.sh cm "Commit message here"

### pl: Pull

Pull the latest changes for your current branch

__Usage__

Pull the latest changes for your current branch

    $ ./gt.sh pl

### de: Delete

Delete a branch, or list of branches

__Flags:__

* -D: Force delete a branch

__Usage:__

Delete a branch or a list of branches

    $ ./gt.sh de branch-name other-branch-name

_Deletes 'branch-name' and 'other-branch-name' branches._

Force delete a branch or a list of branches

    $ ./gt.sh de -D branch-name other-branch-name

_Force deletes the 'branch-name' and 'other-branch-name' branches._

### Notes

All commands listed above can be run in any order. Ex:

    $ ./gt.sh br -d branch other-branch

Could also be written as

    $ ./gt.sh other-branch br branch -d

Could also be written as

    $ ./gt.sh branch other-branch br -d

Or any other way you can imagine it.

The only drawback to this is that there are certain branch names that cannot be used because of this, these are: st, br, ad, cm, pl, de - or anyother command name that I might have forgotten to list here
