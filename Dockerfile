FROM ubuntu:16.04
MAINTAINER Kirill Pavlov <kirill.pavlov@phystech.edu>

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3.5-minimal \
    python3.5-dev \
    python3-pip \
    # numpy
    liblapack-dev \
    libopenblas-dev \
    libatlas-base-dev \
    # matplotlib
    libxft-dev \
    libfreetype6-dev

RUN pip3 install --upgrade pip

ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

RUN pip install numpy==1.10.4
RUN pip install scipy==0.17.0
RUN pip install matplotlib==1.5.1
RUN pip install \
    pandas==0.17.1 \
    seaborn==0.7.0 \
    xgboost==0.4a30 \
    plotly==1.9.5 \
    sympy==0.7.6.1 \
    Theano==0.7.0 \
    Keras==0.3.2 \
    Lasagne==0.1 \
    scikit-learn==0.17

RUN pip install jupyter==1.0.0

# RUN pip3 install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.6.0-cp34-none-linux_x86_64.whl

WORKDIR /notebooks

ENTRYPOINT ["/tini", "--"]
