#####################
# DEVELOPMENT STAGE #
#####################
FROM ruby:3.0.2 as development

WORKDIR /srv/app
EXPOSE 3000

# Install Node
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
  && apt-get update \
  && apt-get install -y nodejs 

# Install Yarn (needed by Webpacker)
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt update \
  && apt install yarn

RUN bundle config set --local path 'vendor/bundle'

# Prevents restarts if `server.pid` already exists and creates `master.key` file.
# https://docs.docker.com/samples/rails/
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["bin/rails", "server", "-b", "0.0.0.0"]

###############
# BUILD STAGE #
###############
FROM development as production

# Throw errors if Gemfile has been modified since Gemfile.lock
# RUN bundle config --global frozen 1
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY package.json yarn.lock ./
RUN yarn

COPY . .

# https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#procfile
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]