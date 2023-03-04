FROM ruby:2.4.10
RUN apt-get update
RUN apt-get -y install curl
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash
RUN apt-get -y install nodejs
RUN node -v
RUN npm -v

ADD Gemfile /hockey_app/Gemfile
ADD Gemfile.lock /hockey_app/Gemfile.lock

WORKDIR /hockey_app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

CMD ["bash","docker/start.sh", "${PORT}", "${DB_ENV}"]