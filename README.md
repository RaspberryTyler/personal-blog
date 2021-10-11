# Tinker Log

My personal blog. Built on Rails, Postgres, Docker and duct tape.

## Installing locally

When first pulling down you'll need to install the dependencies in the host OS.

Run the following commands after first cloning the project:

```sh
docker-compose build
docker-compose run --rm yarn
docker-compose run --rm tinkerlog bundle install
docker-compose run --rm tinkerlog bin/rails db:migrate
docker-compose up
```

## Building the production images

Run the following command:

```sh
docker-compose -f docker-compose.yml -f docker-compose.build.yml build
```

## Running the production image

Run the following command:

```sh
docker-compose -f docker-compose.prod.yml up
```

## More information

The read me that explains how the rails app works is in the Rails folder. This dockerization is a work in progress.
