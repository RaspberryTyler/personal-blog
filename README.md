# Tinker Log

My personal blog. Built on Rails, Postgres, Docker and duct tape.

## Installing locally

When first pulling down you'll need to install the dependencies in the host OS.

Run the following script after first cloning the project:

```sh
./scripts/setup-local.sh
```

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

- Figure out if that hosts thing I added to the config was actually necessary
- Try to get variable interpolation to work in caddyfile url
- Maybe use non-root user in Rails dockerfile
- Create an `.env.example` file
- Figure out what to do with rbenv files and vars

- Move blogs from current site to this Docker branch

- Create repos on Docker Hub
- Configure Ansible setup script
- Configure Terraform setup script
