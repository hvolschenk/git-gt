# Get the root directory
rootDirectory="${BASH_SOURCE%/*}"
if [[ ! -d "$rootDirectory" ]]; then
  rootDirectory="$PWD";
fi

let clone=remoteAdd=status=branch=add=commit=pull=push=delete=merge=rebase=false
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
    -d) flagDelete=true;;
    -D) flagForceDelete=true;;
    *)
      variables[variablesCount]="$argument"
      ((variablesCount+=1));;
  esac
done

__getCurrentBranchName () {
  echo "`git rev-parse --abbrev-ref HEAD`"
}

# Run commands in order of importance, the way I do it might seem silly but it
# removes the ned for a bunch of 'exit's and this way I can unset the variables
# every time right at the end
if [ $clone = true ]; then
  . $rootDirectory/lib/cl/gt-cl.sh
else
  if [ $remoteAdd = true ]; then
    . $rootDirectory/lib/ra/gt-ra.sh
  else
    if [ $status = true ]; then
      . $rootDirectory/lib/st/gt-st.sh
    else
      if [ $branch = true ]; then
        . $rootDirectory/lib/br/gt-br.sh
      else
        if [ $add = true ]; then
          . $rootDirectory/lib/ad/gt-ad.sh
        else
          if [ $commit = true ]; then
            . $rootDirectory/lib/cm/gt-cm.sh
          else
            if [ $pull = true ]; then
              . $rootDirectory/lib/pl/gt-pl.sh
            else
              if [ $push = true ]; then
                . $rootDirectory/lib/ps/gt-ps.sh
              else
                if [ $delete = true ]; then
                  . $rootDirectory/lib/de/gt-de.sh
                else
                  if [ $merge = true ]; then
                    . $rootDirectory/lib/mg/gt-mg.sh
                  else
                    if [ $rebase = true ]; then
                      . $rootDirectory/lib/rb/gt-rb.sh
                    fi
                  fi
                fi
              fi
            fi
          fi
        fi
      fi
    fi
  fi
fi

unset -f __getCurrentBranchName
unset -v clone remoteAdd status branch add commit pull push delete merge rebase flagDelete flagForceDelete variables variablesCount

exit 0
