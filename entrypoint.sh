#!/bin/sh

set -e

if [ -z ${CRED+x} ]; then
  echo "No credentials specified, ypu may get into errors."
else
  echo "Authentication using $CRED";

  if [ $CRED == "username" ];
  then
    sh -c "jfrog rt config --interactive=false --enc-password=true --url=$URL --user=$USER --password=$PASSWORD"
  elif [ $CRED == "apikey" ];
  then
    sh -c "jfrog rt config --interactive=false --enc-password=true --url=$URL --apikey=$APIKEY"
  elif [ $CRED == "accesstoken" ];
    sh -c "jfrog rt config --interactive=false --enc-password=true --url=$URL --access-token=$ACCESSTOKEN"
  else
    echo "";
  fi
fi

# Capture output
output=$( sh -c "jfrog rt $*" )

# Preserve output for consumption by downstream actions
echo "$output" > "${HOME}/${GITHUB_ACTION}.log"

# Write output to STDOUT
echo "$output"
