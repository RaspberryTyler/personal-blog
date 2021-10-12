# README

This is a personal blog that I'm building with Rails to force myself to learn Ruby and the Rails framework. I'm a big fan of Hugo's workflow for editing blogs as version-controllable static files, so I'm trying to build a similar structure and this probably looks nothing like a Rails app. It's just for learning though, and I get to learn more than I ever wanted to know about deploying Ruby to a server.

To run the database migrations, run the following command:

```sh
bin/rails db:migrate
```

To import the blog posts into the SQLite database, run the following commmand:

```sh
rake posts:import
```

Since the database is constructed on the fly, you can destroy the whole schema and start fresh when you need to change schema. To re-run all migrations, run the following command:

```
bin/rails db:migrate:reset
```

## Draft posts

Draft posts that are not yet proofread to be stored in Git may be stored in `app/content/drafts`. Posts in these folder are not added to Git, and can be moved into `app/content` when you're ready to commit them.

To create a new draft post, run the following command:

```
rake posts:draft["Name of your post"]
```

This will scaffold the necessary markdown for a new post.

## Development

Run `yarn start` to start development. This will start Webpack dev server, and give automatic page reloads and post imports when content changes. It will also automatically change the file names to a `yyyy-mm-dd_slug-of-post.md` format so filenames and post titles don't fall out of sync.

## Production

In production, you'll need to add the following environment variable to completely rebuild the database:

```
DISABLE_DATABASE_ENVIRONMENT_CHECK=1
```

TODO: ADD THE FOLLOWING:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
