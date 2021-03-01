FROM ruby:2.7.1

RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs           

RUN mkdir /app_name 
ENV APP_ROOT /app_name 
WORKDIR $APP_ROOT

COPY Gemfile Gemfile.lock $APP_ROOT/

RUN bundle install

COPY . $APP_ROOT

CMD rails server -p $PORT -b 0.0.0.0