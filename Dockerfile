FROM --platform=linux/amd64 ruby:3.0.3-alpine
RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      git \
      less \
      libstdc++ \
      libgcrypt-dev \
      netcat-openbsd \
      nodejs \
      pkgconfig \
      postgresql-dev \
      tzdata \
      yarn 

WORKDIR /concurrency-control-api
COPY Gemfile /concurrency-control-api/Gemfile
COPY Gemfile.lock /concurrency-control-api/Gemfile.lock


RUN gem install bundler:2.3.5
# RUN bundle config build.nokogiri --use-system-libraries
# RUN gem install nokogiri --platform=ruby


RUN bundle install 

COPY . /concurrency-control-api

COPY ./entrypoints/app-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/app-entrypoint.sh

ENTRYPOINT ["/usr/bin/app-entrypoint.sh"]