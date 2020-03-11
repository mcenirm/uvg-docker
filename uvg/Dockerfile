FROM ruby:2.5.1

RUN gem install bundler -v 1.17.3

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

ADD uvg-master.tgz ./

RUN bundle install

EXPOSE 3000

COPY config/ ./config

CMD ["rails", "s", "-e", "production"]
