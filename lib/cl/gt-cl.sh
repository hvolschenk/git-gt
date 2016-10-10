if [ -z ${variables[0]} ]; then
  echo Please specify a remote url when cloning: gt cl <url> [<folder>]
fi

git clone ${variables[0]} ${variables[1]}
