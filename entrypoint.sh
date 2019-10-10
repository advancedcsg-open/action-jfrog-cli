#!/bin/sh

set -e

if [ -z ${CRED+x} ]; then
  echo "No credentials specified, ypu may get into errors."
else
  echo "Authentication using $CRED";

  if [ $CRED == "username" ];
  then
    sh -c "jfrog rt c action-server --interactive=false --url=$URL --user=$USER --password=$PASSWORD"
  elif [ $CRED == "apikey" ];
  then
    sh -c "jfrog rt c action-server --interactive=false --url=$URL --apikey=$APIKEY"
  elif [ $CRED == "accesstoken" ];
  then
    sh -c "jfrog rt c action-server --interactive=false --url=$URL --access-token=$ACCESSTOKEN"
  fi
  sh -c "jfrog rt use action-server"
fi

# Capture output
output=$( sh -c "jfrog rt $*" )

# Preserve output for consumption by downstream actions
echo "$output" > "${HOME}/${GITHUB_ACTION}.log"

# Write output to STDOUT
echo "$output"
