rebaseBranch=${variables[0]}
currentBranch=$(__getCurrentBranchName)

if [ -z ${rebaseBranch} ]; then
  echo 'Please select a branch to rebase your current branch on top of: gt rb <branch>'
  exit 1
fi

git checkout $rebaseBranch
git pull origin $rebaseBranch
git checkout $currentBranch
git rebase $rebaseBranch

unset -v rebaseBranch currentBranch
