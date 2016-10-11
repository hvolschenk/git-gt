commitMessage='git commit';

if [ ! -z "${variables[0]}" ]; then
  commitMessage="${commitMessage} -m \"${variables[0]}\""
fi

eval $commitMessage

unset -v commitMessage
