# Tinker Log

My personal blog. Built on Rails, Postgres, Docker and duct tape.

## Installing and developing locally

When first pulling down you'll need to install the dependencies in the host OS and create and `.env` file.

Run the following script after first cloning the project to create an `.env` file from the example, build your development containers, and install your dependencies in the mounted host folders:

```sh
./scripts/setup-local.sh
```

**After running this, you will need to find the project's master key from outside this repo and copy it into the newly created `.env` file.**

As a note, `APP_URL` in `.env` must be set to `http://0.0.0.0:8080` to work on your local machine.

To begin developing, run `docker-compose up`.

## Building the production images

Run the following script:

```sh
./scripts/build-prod.sh
```

## Running the production image

Run the following script:

```sh
./scripts/run-prod.sh
```

## More information

The read me that explains how the rails app works is in the Rails folder. This dockerization is a work in progress.

## Todo

My todo list for tomorrow:

- Maybe use non-root user in Rails dockerfile

- Create repos on Docker Hub
- Configure Ansible setup script
- Configure Terraform setup script
