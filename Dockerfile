FROM alpine:3.3
MAINTAINER Kirill Pavlov <kirill.pavlov@phystech.edu>

RUN apk add --update \
  --repository "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" \
  --repository "@community http://dl-1.alpinelinux.org/alpine/edge/community/" \
    build-base \
    wget \
    'python3>=3.5.1-r0' \
    'python3-dev>=3.5.1-r0' \
    gfortran \
    openblas@testing \
    lapack@testing \
    tini@community
    # py-numpy@testing=1.10.4-r0 \
    # py-scipy@testing=0.17.0-r0 \
    # py-pip \
  # && pip install --upgrade pip \
  # && pip install virtualenv \
  # && rm -rf /var/cache/apk/*

RUN cd /tmp && wget -q --no-check-certificate https://bootstrap.pypa.io/get-pip.py && python3 /tmp/get-pip.py

# RUN apk add zeromq readline

RUN ar r /usr/lib/libopenblas.a /usr/lib/libopenblas.so.3

RUN ar r /usr/lib/liblapack.a /usr/lib/liblapack.so.3

ADD . /app

RUN pip install --requirement /app/requirements.txt

WORKDIR /notebooks

ENTRYPOINT ["tini", "--"]
