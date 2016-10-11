checkout=
branch=${variables[0]}

if [ -z $branch ]; then
  git branch
else
  if [ $flagDelete = true ] || [ $flagForceDelete = true ]; then
    . $rootDirectory/lib/de/gt-de.sh
  else
    checkout="`git checkout $branch 2>&1`"
    if [ $? -eq 0 ]; then
      echo "$checkout"
    else
      git checkout ${variables[1]:-master}
      git checkout -b $branch
    fi
  fi
fi

unset -v branch checkout
