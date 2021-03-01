#!/bin/bash

r="$(cd lua-language-server && git describe --tags --abbrev=0)"
[[ "$r" == "" ]] && r="$(cd lua-language-server && cat changelog.md | grep '^##' | head -n1 | sed 's/^## //')"
f=0;
while read -r line; do
  if [[ $line = '## '$r ]]; then
    f=1;
  elif [[ $f -eq 1 ]] && [[ $line =~ '##' ]]; then
    f=0;
  elif [[ $f -eq 1 ]]; then
    echo "$line"
  fi

done < lua-language-server/changelog.md

