FROM ruby:2.7

WORKDIR /app

RUN gem install nokogiri pg activerecord

COPY ./app/ /app/

ENTRYPOINT [ "ruby" ]

CMD ["main.rb"]
