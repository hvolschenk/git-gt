# The default set of options
clone=false
remoteAdd=false
status=false
branch=false
add=false
commit=false
pull=false
push=false
delete=false
merge=false
rebase=false

# The default list of flags
flagDelete=false
flagForceDelete=false

# The list of extra variables passed to the method
variables=
variablesCount=0

# The complete list of arguments passed in as an array
for argument; do
  case $argument in
    cl)
      clone=true;;
    ra)
      remoteAdd=true;;
    st)
      status=true;;
    br)
      branch=true;;
    ad)
      add=true;;
    cm)
      commit=true;;
    pl)
      pull=true;;
    ps)
      push=true;;
    de)
      delete=true;;
    mg)
      merge=true;;
    rb)
      rebase=true;;
    -d)
      flagDelete=true;;
    -D)
      flagForceDelete=true;;
    *)
      variables[variablesCount]="$argument"
      ((variablesCount+=1));;
  esac
done

__getCurrentBranchName () {
  echo "`git rev-parse --abbrev-ref HEAD`"
}

gt__cl () {
  if [ -z ${variables[0]} ]; then
    echo Please specify a remote url when cloning: gt cl <url> [<folder>]
  fi

  git clone ${variables[0]} ${variables[1]}
}

gt__ra () {
  if [ -z ${variables[0]} ]; then
    echo 'Please specify a remote url when adding a remote: gt ra <url>'
  fi

  git init
  git remote add origin ${variables[0]}
}

gt__st () {
  clear
  git branch
  git status
}

gt__br () {
  branch=${variables[0]}

  if [ -z $branch ]; then
    git branch
  fi

  if [ $flagDelete = true ] || [ $flagForceDelete = true ]; then
    gt__de
  fi

  checkout="`git checkout $branch 2>&1`"

  if [ $? -eq 0 ]; then
    echo "$checkout"
  else
    git checkout ${variables[1]:-master}
    git checkout -b $branch
  fi

  unset -v branch checkout
  exit 0
}

gt__ad () {
  local files=$(IFS=, ; echo "${variables[*]}")
  if [ -z $files ]; then
    files=.
  fi
  git add $files
  exit 0
}

gt__cm () {
  local commitMessage='git commit';
  if [ ! -z "${variables[0]}" ]; then
    commitMessage="${commitMessage} -m \"${variables[0]}\""
  fi
  eval $commitMessage
  exit 0
}

gt__pl () {
  git pull origin $(__getCurrentBranchName)
  exit 0
}

gt__ps () {
  git push origin $(__getCurrentBranchName)
  exit 0
}

gt__de () {
  if [ -z ${variables[0]} ]; then
    echo 'Please select a branch to delete: gt de <...branch>'
    exit 1;
  fi

  local deleteString='-d'
  if [ $flagForceDelete = true ]; then
    deleteString='-D'
  fi

  for deleteBranch in ${variables[@]}; do
    git branch $deleteString $deleteBranch
  done

  exit 0
}

gt__mg () {
  if [ -z ${variables[0]} ]; then
    echo 'Please select a branch to merge into your current branch: gt mg <branch>'
    exit 1
  fi

  local branch=${variables[0]}
  local currentBranch=$(__getCurrentBranchName)
  git checkout $branch
  git pull origin $branch
  git checkout $currentBranch
  git merge $branch
}

gt__rb () {
  if [ -z ${variables[0]} ]; then
    echo 'Please select a branch to rebase your current branch on top of: gt rb <branch>'
    exit 1
  fi

  local branch=${variables[0]}
  local currentBranch=$(__getCurrentBranchName)
  git checkout $branch
  git pull origin $branch
  git checkout $currentBranch
  git rebase $branch
}

# Run commands in order of importance

if [ $clone = true ]; then
  gt__cl
  exit 0
fi

if [ $remoteAdd = true ]; then
  gt__ra
  exit 0
fi

if [ $status = true ]; then
  gt__st
  exit 0
fi

if [ $branch = true ]; then
  gt__br
  exit 0
fi

if [ $add = true ]; then
  gt__ad
  exit 0
fi

if [ $commit = true ]; then
  gt__cm
  exit 0
fi

if [ $pull = true ]; then
  gt__pl
  exit 0
fi

if [ $push = true ]; then
  gt__ps
  exit 0
fi

if [ $delete = true ]; then
  gt__de
  exit 0
fi

if [ $merge = true ]; then
  gt__mg
  exit 0
fi

if [ $rebase = true ]; then
  gt__rb
  exit 0
fi

unset -f gt__cl gt__ra gt__br gt__st gt__ad gt__cm gt__pl gt__ps gt__de gt__mg gt__rb
unset -v clone remoteAdd status branch add commit pull push delete merge rebase flagDelete flagForceDelete variables variablesCount

exit 0
