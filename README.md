# Git-GT
--------
Faster git

### st: Status
----------
Clears the terminal, shows a list of branches, and the current status

_Usage:_
* Show the status
  * $ ./gt.sh st
    * -- clear
    * -- git branch
    * -- git status

### br: Branch
----------
Switch to, or create, a new branch

_Flags:_
* -d: Delete a branch
* -D: Force delete a branch

_Usage:_
* Show a list of all branches
  * $ ./gt.sh br
    * -- git branch
* Switch to (check out) a branch
  * $ ./gt.sh br branch-name
    * -- git checkout branch-name
  * _This will check out a branch by the name 'branch-name'. However, if a branch by the name 'branch-name' does not exist, master will be checked out and a new branch by the name 'branch-name' will be created._
* Create a new branch
  * $ ./gt.sh br new-branch-name
    * -- git checkout master
    * -- git checkout -b new-branch-name
  * _This will check out master and then check out a new branch with the name 'new-branch-name'._
* Create a new branch from an existing branch
  * $ ./gt.sh br new-branch-name existing-branch-name
    * -- git checkout from
    * -- git checkout -b branch
  * _This will check out 'existing-branch-name' and the check out a new branch with the name 'new-branch-name'._
* Delete a branch or a list of branches
  * $ ./gt.sh br -d branch-name other-branch-name
    * -- git branch -d branch-name
    * -- git branch -d other-branch-name
  * _This will delete both 'branch-name' and 'other-branch-name'._
* Force delete a branch or a list of branches
  * $ ./gt.sh br -D branch-name other-branch-name
    * -- git branch -D branch-name
    * -- git branch -D other-branch-name
  * _This will force delete 'branch-name' and 'other-branch-name'._

### de: Delete
----------
Delete a branch, or list of branches

_Flags:_
* -D: Force delete a branch

_Usage:_
* Delete a branch or a list of branches
  * $ ./gt.sh de branch-name other-branch-name
  * _Deletes 'branch-name' and 'other-branch-name' branches._
* Force delete a branch or a list of branches
  * $ ./gt.sh de -D branch-name other-branch-name
  * _Force deletes the 'branch-name' and 'other-branch-name' branches._
