#! /bin/bash

# The webapp must be built first because the webserver uses it as a build stage.
docker-compose -f docker-compose.yml -f docker-compose.build.yml build webapp
docker-compose -f docker-compose.yml -f docker-compose.build.yml build webserver