files=$(IFS=" "; echo "${variables[*]}")

if [ -z "$files" ]; then
  files=.
fi

git add $files

unset -v files
