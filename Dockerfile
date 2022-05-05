FROM ruby:2.7.6-bullseye

RUN gem install bundler:2.3.10

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  nodejs

COPY Gemfile* /app/

ENV BUNDLE_PATH /gems

WORKDIR /app/
RUN bundle package --all-platforms

COPY . /app/

CMD ["bundle", "exec", "middleman", "serve", "--bind-address=0.0.0.0"]
