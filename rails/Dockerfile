#####################
# DEVELOPMENT STAGE #
#####################
FROM ruby:3.0.2 as development

WORKDIR /app
EXPOSE 3000

# Prevents restarts if server.pid already exists.
# https://docs.docker.com/samples/rails/
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update && apt-get install -y nodejs 

# Throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
COPY Gemfile Gemfile.lock ./
RUN bundle config set --local path 'vendor/bundle'
RUN bundle install

COPY package.json package-lock.json ./
RUN npm install

CMD ["bin/rails", "server", "-b", "0.0.0.0"]

###############
# BUILD STAGE #
###############
FROM development as build





COPY . .
RUN bin/rails assets:precompile

####################
# PRODUCTION STAGE #
####################
FROM development as production
COPY . /app
