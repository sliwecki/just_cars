FROM ruby:2.6-alpine

ENV APP_HOME /app
RUN apk update && apk add build-base tzdata htop nodejs postgresql-dev
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock
RUN bundle install
COPY . $APP_HOME

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
