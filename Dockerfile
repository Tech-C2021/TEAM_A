FROM ruby:2.7

WORKDIR /app

RUN yes | apt-get update && yes | apt-get install sqlite3 libsqlite3-dev
RUN gem install thor sqlite3-ruby nokogiri httparty


ENTRYPOINT [ "ruby", "main.rb" ]
