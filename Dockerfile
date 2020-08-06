FROM ruby:2.5.1
RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs
WORKDIR /KStargram
COPY Gemfile Gemfile.lock /KStargram/
COPY . /KStargram
RUN gem install bundler && bundle install 
