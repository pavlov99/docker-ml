FROM alpine:3.3
MAINTAINER Kirill Pavlov <kirill.pavlov@phystech.edu>

RUN apk add --update \
    build-base \
    py-pip \
    python3 \
    python3-dev \
  && pip install --upgrade pip \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*

ADD . /app

RUN virtualenv --python=python3 --no-site-packages /env \
  && /env/bin/pip install --requirement /app/requirements.txt

# WORKDIR /notebooks
