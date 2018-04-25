FROM ruby:2.5.1-alpine3.7

RUN set -x \
    && apk upgrade --update \
    && apk add libxml2-dev libxslt-dev ruby-dev \
    && apk add build-base 