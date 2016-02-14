FROM alpine:3.3
MAINTAINER Kirill Pavlov <kirill.pavlov@phystech.edu>

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk add --update \
    build-base \
    wget \
    'python3>=3.5.1-r0' \
    'python3-dev>=3.5.1-r0' \
    gfortran \
    # py-pip \
    openblas@testing \
    lapack@testing
    # lapack-dev@testing \
    # py-numpy@testing=1.10.4-r0 \
    # py-scipy@testing=0.17.0-r0 \
  # && pip install --upgrade pip \
  # && pip install virtualenv \
  # && rm -rf /var/cache/apk/*

RUN cd /tmp && wget -q --no-check-certificate https://bootstrap.pypa.io/get-pip.py && python3 /tmp/get-pip.py

# ENV LAPACK /usr/lib/liblapack.so.3

# RUN wget -q --no-check-certificate https://github.com/xianyi/OpenBLAS/archive/v0.2.15.tar.gz -O /tmp/openblas.0.2.15.tar.gz

# RUN cd /tmp && wget -q --no-check-certificate http://www.netlib.org/lapack/lapack-3.6.0.tgz

ADD . /app

RUN pip install --requirement /app/requirements.txt

# RUN virtualenv --python=python3 --no-site-packages /env \
  # && /env/bin/pip install --requirement /app/requirements.txt

# WORKDIR /notebooks
