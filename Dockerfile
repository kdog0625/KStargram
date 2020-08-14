FROM ruby:2.5.8
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /KStargram
WORKDIR /KStargram

ADD Gemfile /KStargram/Gemfile


RUN  gem update bundler && bundle install 
CMD ["rails", "server", "-b", "0.0.0.0"]