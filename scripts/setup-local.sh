#! /bin/bash

if [ ! -f .env ]
then
  cp .env.example .env
fi

docker-compose build
docker-compose run --rm webapp yarn
docker-compose run --rm webapp bundle install
docker-compose run --rm webapp bin/rails db:migrate
