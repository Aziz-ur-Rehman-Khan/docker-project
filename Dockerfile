FROM ruby:2.7.1-alpine
# ruby-dev

RUN apk add --update build-base nodejs tzdata  postgresql-dev
RUN mkdir -p /dockerails

COPY . /dockerails
COPY ./Gemfile dockerails/Gemfile
COPY ./Gemfile.lock dockerails/Gemfile.lock
COPY ./entrypoint.sh /usr/bin/entrypoint.sh

WORKDIR /dockerails
RUN chmod +x /usr/bin/entrypoint.sh
RUN bundle install
EXPOSE 3000
ENTRYPOINT ["entrypoint.sh"]

