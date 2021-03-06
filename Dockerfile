FROM ruby:2.6.5

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  nodejs

COPY Gemfile* /app/

ENV BUNDLE_PATH /gems

WORKDIR /app/
RUN bundle install

COPY . /app/

CMD ["middleman", "serve"]
