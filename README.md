GT - Git on drugs
-----------------

st: Status
----------
Clears the terminal, shows a list of branches, and the current status

Usage:
	Show the status
		// gt st
		$ bash ./gt.sh st
		-- clear
		-- git branch
		-- git status

br: Branch
----------
Switch to, or create, a new branch
Flags:
	-d: Delete a branch
	-D: Force delete a branch
Usage:
	Show a list of all branches
		// gt br
		$ bash ./gt.sh br
		-- git branch
	Switch to (check out) a branch
		// gt br <branch>
		// gt <branch> br
		$ bash ./gt.sh br branch-name
		-- git checkout branch-name
		# This will check out a branch by the name 'branch-name'. However, if a
		# branch by the name 'branch-name' does not exist, master will be checked
		# out and a new branch by the name 'branch-name' will be created.
	Create a new branch
		// gt br <branch>
		// gt <branch> br
		$ bash ./gt.sh br new-branch-name
		-- git checkout master
		-- git checkout -b new-branch-name
		# This will check out master and then check out a new branch with the name
		# 'new-branch-name'.
	Create a new branch from an existing branch
		// gt br <branch> <from>
		// gt <branch> br <from>
		// gt <branch> <from> br
		$ bash ./gt.sh br new-branch-name existing-branch-name
		-- git checkout from
		-- git checkout -b branch
		# This will check out 'existing-branch-name' and the check out a new branch
		# with the name 'new-branch-name'
	Delete a branch or a list of branches
		// gt br -d <...branch>
		// gt br <...branch> -d
		// gt -d br <...branch>
		// gt <...branch> br -d
		// gt <...branch> -D br
		$ bash ./gt.sh br -d branch-name other-branch-name
		-- git branch -d branch-name
		-- git branch -d other-branch-name
		# This will delete both 'branch-name' and 'other-branch-name'
	Force delete a branch or a list of branches
		// gt br -D <...branch>
		// gt br <...branch> -D
		// gt -D br <...branch>
		// gt <...branch> br -D
		// gt <...branch> -D br
		$ bash ./gt.sh br -D branch-name other-branch-name
		-- git branch -D branch-name
		-- git branch -D other-branch-name
		# This will force delete 'branch-name' and 'other-branch-name'

de: Delete
----------
Delete a branch, or list of branches
Flags:
	-D: Force delete a branch
Usage:
	Delete a branch or a list of branches
		// gt de <..branch>
		// gt <...branch> de
		$ bash ./gt.sh de branch-name other-branch-name
		# Deletes 'branch-name' and 'other-branch-name' branches
	Force delete a branch or a list of branches
		// gt de -D <...branch>
		// gt de <...branch> -D
		// gt -D <...branch> de
		$ bash ./gt.sh de -D branch-name other-branch-name
		# Force deletes the 'branch-name' and 'other-branch-name' branches
