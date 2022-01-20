FROM ruby:2.7

WORKDIR /app

RUN yes | apt-get update && yes | apt-get install sqlite3 libsqlite3-dev
RUN gem install nokogiri pg activerecord


ENTRYPOINT [ "ruby", "main.rb" ]
