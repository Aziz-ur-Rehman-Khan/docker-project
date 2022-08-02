FROM ruby:2.7.1

#RUN apt-get update && apt-get upgrade -y nodejs
# RUN apt-get install --no-cache add ruby-dev ruby-bundler ruby-json ruby-rake bash

RUN mkdir -p /dockerails

COPY . /dockerails
COPY ./Gemfile dockerails/Gemfile
COPY ./Gemfile.lock dockerails/Gemfile.lock

WORKDIR /dockerails


RUN bundle install
EXPOSE 3000
CMD ["bash"]
