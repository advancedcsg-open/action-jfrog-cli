#!/bin/sh

set -e

echo "Authentication using $INPUT_CREDENTIALS_TYPE";

# Authenticate to the server
if [ $INPUT_CREDENTIALS_TYPE == "username" ];
then
  sh -c "jfrog rt c action-server --interactive=false --url=$INPUT_URL --user=$INPUT_USER --password=$INPUT_PASSWORD"
elif [ $INPUT_CREDENTIALS_TYPE == "apikey" ];
then
  sh -c "jfrog rt c action-server --interactive=false --url=$INPUT_URL --apikey=$INPUT_APIKEY"
elif [ $INPUT_CREDENTIALS_TYPE == "accesstoken" ];
then
  sh -c "jfrog rt c action-server --interactive=false --url=$INPUT_URL --access-token=$INPUT_ACCESS_TOKEN"
fi
sh -c "jfrog rt use action-server"

# Set working directory if specified
if [ $INPUT_WORKING_DIRECTORY != '.' ];
then
  cd $INPUT_WORKING_DIRECTORY
fi

# Log command for info
echo "[Info] jfrog rt $*"

# Capture output
output=$( sh -c "jfrog rt $*" )

# Preserve output for consumption by downstream actions
echo "$output" > "${HOME}/${GITHUB_ACTION}.log"

# Write output to STDOUT
echo "$output"
