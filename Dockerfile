FROM alpine:3.3
MAINTAINER Kirill Pavlov <kirill.pavlov@phystech.edu>

RUN apk add --update \
    python3 \
    python3-dev

CMD ["/bin/sh"]
