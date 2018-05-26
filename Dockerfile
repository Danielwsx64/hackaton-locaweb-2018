FROM ruby:2.4.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /hackathon-argentina

WORKDIR /hackathon-argentina

ADD Gemfile /hackathon-argentina/Gemfile
ADD Gemfile.lock /hackathon-argentina/Gemfile.lock

RUN bundle install
ADD . /hackathon-argentina
