#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

if [ -n $MASTER_KEY ]
then
  echo $MASTER_KEY > config/master.key
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"