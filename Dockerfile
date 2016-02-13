FROM alpine:3.3
MAINTAINER Kirill Pavlov <kirill.pavlov@phystech.edu>

RUN apk add --update \
    python3 \
    python3-dev \
    openssl

RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py

CMD ["/bin/sh"]
