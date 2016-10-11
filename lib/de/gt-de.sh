deleteString='-d'

if [ -z ${variables[0]} ]; then
  echo 'Please select a branch to delete: gt de <...branch>'
  exit 1;
fi

if [ $flagForceDelete = true ]; then
  deleteString='-D'
fi

for deleteBranch in ${variables[@]}; do
  git branch $deleteString $deleteBranch
done

unset -v deleteString
