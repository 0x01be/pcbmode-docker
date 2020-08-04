FROM 0x01be/alpine:edge as builder

RUN apk add --no-cache --virtual pcbmode-build-dependencies \
    git \
    build-base \
    python3-dev \
    py3-pip \
    libxml2-dev \
    libxslt-dev

RUN pip install git+https://github.com/boldport/pcbmode

RUN sed -i.bak 's/print pours/print(pours)/g'  /usr/lib/python3.8/site-packages/pcbmode/utils/utils.py

