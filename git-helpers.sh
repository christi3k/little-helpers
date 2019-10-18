#!/bin/bash

ghi () {
  echo "getting ignore file for" "$1"
  wget https://raw.githubusercontent.com/github/gitignore/master/"${1}".gitignore
  echo "appending to .gitignore.."
  cat "${1}".gitignore >> .gitignore
  echo "cleaning up downloaded file..."
  rm "${1}".gitignore
  echo "done!"
}

gpr-log () {
  git log --name-status "$1".."$2" | grep -E '^[A-Z]\s' | sort | uniq
}
