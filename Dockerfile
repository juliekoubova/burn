FROM ruby:3.1-bullseye

# throw errors if Gemfile has been modified since Gemfile.lock
COPY Gemfile Gemfile.lock ./
RUN bundle config --global frozen 1

COPY . .
RUN bundle install

ENTRYPOINT ["foreman", "start"]