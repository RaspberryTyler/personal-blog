#! /bin/bash

# The webapp must be built first because the webserver uses it as a build stage.

# if [ $1 = webapp ] || [ -z $1 ]; then
  docker-compose -f docker-compose.yml -f docker-compose.build.yml build webapp
# elif [ $1 = webserver ] || [ -z $1 ]; then
  docker-compose -f docker-compose.yml -f docker-compose.build.yml build webserver
# fi