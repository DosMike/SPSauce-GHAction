#!/bin/bash
# check if java is installed
if ! which java >/dev/null ; then
  echo 'Could not find Java - SPSauce requires Java 8+'
  exit 1
fi

# check if git is installed - depedency clone will try to use system git
if ! which git >/dev/null ; then
  echo 'Could not find git - Some dependencies might fail!'
  exit 1
fi

# search for the jar file relative to this script
scriptDir=$PWD
cd ${0%/*}
fname="$PWD/spsauce/"$(ls -r1A spsauce | grep '^SPSauce-.*\.jar$' | head -n1)
cd $scriptDir

# run the jar file from the spsauce directory
if [[ ! -f $fname ]]; then
  echo 'Could not find any SPSauce jar binary'
  exit 1
fi

java -jar $fname $@
