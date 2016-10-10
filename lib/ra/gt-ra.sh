if [ -z ${variables[0]} ]; then
  echo 'Please specify a remote url when adding a remote: gt ra <url>'
fi

git init
git remote add origin ${variables[0]}
