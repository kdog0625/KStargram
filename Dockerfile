FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /KStargram
WORKDIR /KStargram

COPY Gemfile /KStargram/Gemfile
COPY Gemfile.lock /KStargram/Gemfile.lock

RUN gem install bundler && bundle install 
COPY . /KStargram