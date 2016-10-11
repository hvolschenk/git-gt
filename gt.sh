# Get the root directory
rootDirectory="${BASH_SOURCE%/*}"
if [[ ! -d "$rootDirectory" ]]; then
  rootDirectory="$PWD";
fi

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
  . $rootDirectory/lib/cl/gt-cl.sh
fi

if [ $remoteAdd = true ]; then
  . $rootDirectory/lib/ra/gt-ra.sh
fi

if [ $status = true ]; then
  . $rootDirectory/lib/st/gt-st.sh
fi

if [ $branch = true ]; then
  . $rootDirectory/lib/br/gt-br.sh
fi

if [ $add = true ]; then
  . $rootDirectory/lib/ad/gt-ad.sh
fi

if [ $commit = true ]; then
  . $rootDirectory/lib/cm/gt-cm.sh
fi

if [ $pull = true ]; then
  . $rootDirectory/lib/pl/gt-pl.sh
fi

if [ $push = true ]; then
  . $rootDirectory/lib/ps/gt-ps.sh
fi

if [ $delete = true ]; then
  . $rootDirectory/lib/de/gt-de.sh
fi

if [ $merge = true ]; then
  . $rootDirectory/lib/mg/gt-mg.sh
fi

if [ $rebase = true ]; then
  gt__rb
fi

unset -f gt__cl gt__ra gt__br gt__st gt__ad gt__cm gt__pl gt__ps gt__de gt__mg gt__rb
unset -v clone remoteAdd status branch add commit pull push delete merge rebase flagDelete flagForceDelete variables variablesCount

exit 0
