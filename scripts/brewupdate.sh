#!/bin/bash
export PATH="/usr/local/bin:$PATH"

touch brew doctor 2> /dev/null

if [ $? -eq 0 ]
then
  osascript -e 'display notification "Brew Doctor Completed"'
  echo "Brew updated"
  exit 0
else
  echo "Could not create file" >&2
  exit 1
fi
