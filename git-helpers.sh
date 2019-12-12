#!/bin/bash

ghi () {
  echo "getting ignore file for" "$1"
  filename=$(basename -- "$1")
  # repo for browsing: https://github.com/github/gitignore
  wget -O "${filename}".gitignore https://raw.githubusercontent.com/github/gitignore/master/"${1}".gitignore
  echo "appending to .gitignore.."
  cat "${filename}".gitignore >> .gitignore
  echo "cleaning up downloaded file..."
  rm "${filename}".gitignore
  echo "done!"
}

#gpr-log () {
  #git log --name-status "$1".."$2" | grep -E '^[A-Z]\s' | sort | uniq
#}
gpr-log () {
  git log --name-status "$1" | grep -E '^[A-Z]\s' | sort | uniq
}
