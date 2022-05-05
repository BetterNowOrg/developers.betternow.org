FROM ruby:2.7.2

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  nodejs

COPY Gemfile* /app/

ENV BUNDLE_PATH /gems

WORKDIR /app/
RUN bundle install

COPY . /app/

CMD ["bundle", "exec", "middleman", "serve", "--bind-address=0.0.0.0"]
