FROM alpine:3.3
MAINTAINER Kirill Pavlov <kirill.pavlov@phystech.edu>

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk add --update \
    build-base \
    wget \
    'python3>=3.5.1-r0' \
    'python3-dev>=3.5.1-r0' \
    gfortran \
    openblas@testing \
    lapack@testing
    # py-numpy@testing=1.10.4-r0 \
    # py-scipy@testing=0.17.0-r0 \
    # py-pip \
  # && pip install --upgrade pip \
  # && pip install virtualenv \
  # && rm -rf /var/cache/apk/*

RUN cd /tmp && wget -q --no-check-certificate https://bootstrap.pypa.io/get-pip.py && python3 /tmp/get-pip.py

# RUN apk add zeromq readline

RUN ar r /usr/lib/libopenblas.a /usr/lib/libopenblas.so.3
# ENV BLAS=/usr/lib/libopenblas.a

RUN ar r /usr/lib/liblapack.a /usr/lib/liblapack.so.3
# ENV LAPACK=/usr/lib/liblapack.a

ADD . /app

RUN pip install --requirement /app/requirements.txt

# RUN virtualenv --python=python3 --no-site-packages /env \
  # && /env/bin/pip install --requirement /app/requirements.txt

WORKDIR /notebooks
