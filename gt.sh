# Get the root directory
rootDirectory="${BASH_SOURCE%/*}"
if [[ ! -d "$rootDirectory" ]]; then
  rootDirectory="$PWD";
fi

let clone=remoteAdd=status=branch=add=commit=pull=push=delete=merge=rebase=diff=upstream=false
let flagDelete=flagForceDelete=false

# The list of extra variables passed to the method
variables=
variablesCount=0

# The complete list of arguments passed in as an array
for argument; do
  case $argument in
    cl) clone=true;;
    ra) remoteAdd=true;;
    st) status=true;;
    br) branch=true;;
    ad) add=true;;
    cm) commit=true;;
    pl) pull=true;;
    ps) push=true;;
    de) delete=true;;
    mg) merge=true;;
    rb) rebase=true;;
    df) diff=true;;
    us) upstream=true;;
    -d) flagDelete=true;;
    -D) flagForceDelete=true;;
    *)
      variables[variablesCount]="$argument"
      ((variablesCount+=1));;
  esac
done

# This should only be run right at the end
# As it removes some necessary functions for the running of this script
__end () {
  unset -v clone remoteAdd status branch add commit pull push delete merge rebase flagDelete flagForceDelete variables variablesCount
  unset -f __getCurrentBranchName
  exit 0
}

__getCurrentBranchName () {
  echo "`git rev-parse --abbrev-ref HEAD`"
}

if [ "$clone" = true ]; then
  source $rootDirectory/lib/cl/gt-cl.sh
  __end
fi

if [ "$remoteAdd" = true ]; then
  source $rootDirectory/lib/ra/gt-ra.sh
  __end
fi

if [ "$status" = true ]; then
  source $rootDirectory/lib/st/gt-st.sh
  __end
fi

if [ "$branch" = true ]; then
  source $rootDirectory/lib/br/gt-br.sh
  __end
fi

if [ "$add" = true ]; then
  source $rootDirectory/lib/ad/gt-ad.sh
  __end;
fi

if [ "$commit" = true ]; then
  source $rootDirectory/lib/cm/gt-cm.sh
  __end
fi

if [ "$pull" = true ]; then
  source $rootDirectory/lib/pl/gt-pl.sh
  __end
fi

if [ "$push" = true ]; then
  source $rootDirectory/lib/ps/gt-ps.sh
  __end
fi

if [ "$delete" = true ]; then
  source $rootDirectory/lib/de/gt-de.sh
  __end
fi

if [ "$merge" = true ]; then
  source $rootDirectory/lib/mg/gt-mg.sh
  __end
fi

if [ "$rebase" = true ]; then
  source $rootDirectory/lib/rb/gt-rb.sh
  __end
fi

if [ "$diff" = true ]; then
  source $rootDirectory/lib/df/gt-df.sh
  __end
fi

if [ "$upstream" = true ]; then
  source $rootDirectory/lib/us/gt-us.sh
  __end
fi
