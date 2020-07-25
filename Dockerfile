FROM alpine:3.12.0 as builder

RUN apk add --no-cache --virtual build-dependencies \
    git \
    build-base \
    python3-dev \
    py3-pip \
    libxml2-dev \
    libxslt-dev

RUN pip install git+https://github.com/boldport/pcbmode

RUN sed -i.bak 's/print pours/print(pours)/g'  /usr/lib/python3.8/site-packages/pcbmode/utils/utils.py

