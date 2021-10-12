#!/bin/bash

# Not sure what set -e does, I copied this from the Docker website:
# https://docs.docker.com/samples/rails/
set -e

# Remove a potentially pre-existing server.pid for Rails.
SERVER_PID=/srv/app/tmp/pids/server.pid
if [ -f $SERVER_PID ]
then
  rm -f /srv/app/tmp/pids/server.pid
fi

if [ -n $MASTER_KEY ]
then
  pwd
  whoami
  echo $MASTER_KEY > /srv/app/config/master.key
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"