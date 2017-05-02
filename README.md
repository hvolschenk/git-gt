# Git-GT
--------
Faster git. For now as a shell script, will still think about packaging once more functions are added.


## Setting up

Setting up git-gt is simple. Clone the repository and create an alias pointing to the shell script with:

    alias gt='~/Software/git-gt/gt.sh'

If you are unsure where to place the above line, you can read my [Bash alias tutorial](https://medium.com/@righteous.trespasser/bash-aliases-1b74175e8648).

## Commands:

Currently the following commands are available:

* [ad: Add](lib/ad)
* [br: Branch](lib/br)
* [cl: Clone](lib/cl)
* [cm: Commit](lib/cm)
* [de: Delete](lib/de)
* [mg: Merge](lib/mg)
* [pl: Pull](lib/pl)
* [ps: Push](lib/ps)
* [ra: Remote add](lib/ra)
* [rb: Rebase](lib/rb)
* [st: Status](lib/st)
* [df: Diff](lib/df)

### Notes

All commands listed above can be run in any order. Ex:

    $ gt br -d branch other-branch

Could also be written as

    $ gt other-branch br branch -d

Could also be written as

    $ gt branch other-branch br -d

Or any other way you can imagine it.

The only drawback to this is that there are certain branch names that cannot be used because of this, these are: st, br, ad, cm, pl, ps, de, mg, rb - or anyother command name that I might have forgotten to list here
