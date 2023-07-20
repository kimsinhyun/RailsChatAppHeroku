FROM ruby:3.2.2-alpine

COPY Gemfile* /app/

WORKDIR /app

#COPY . /app

RUN gem install bundler

COPY . .

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
