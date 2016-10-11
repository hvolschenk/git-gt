mergeBranch=${variables[0]}
currentBranch=$(__getCurrentBranchName)

if [ -z ${mergeBranch} ]; then
  echo 'Please select a branch to merge into your current branch: gt mg <branch>'
  exit 1
fi

git checkout $mergeBranch
git pull origin $mergeBranch
git checkout $currentBranch
git merge $mergeBranch

unset -v branch currentBranch
