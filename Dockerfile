FROM java:8-jdk-alpine

MAINTAINER Shoma Nishitateno <shoma416@gmail.com>

ENV SBT_VERSION=0.13.15 SBT_HOME=/usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

RUN set -xe \
    && apk update \
    && apk add --no-cache \
        ca-certificates \
        curl \
        unzip \
        bash

RUN set -xe \
    && curl -sL "http://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.tgz" \
        | gunzip \
        | tar -x -C /usr/local \
    && sbt update