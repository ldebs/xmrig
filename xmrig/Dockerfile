FROM alpine:latest

RUN apk add --no-cache --virtual .build-deps \
         git \
         cmake \
         make \
         g++ \
         musl-dev \
         libuv-dev \
         openssl-dev \
         libmicrohttpd-dev \
 && mkdir -p /xmrig/build \
 && cd /xmrig \
 && git clone https://github.com/xmrig/xmrig.git \
 && cd build \
 && cmake ../xmrig \
 && make -j$(nproc) \
 && ./xmrig --version \
 && cp ./xmrig /usr/local/bin \
 && apk del .build-deps \
 && cd / \
 && rm -rf /xmrig \
 && apk add --no-cache \
         libuv \
         libmicrohttpd \
         util-linux \
		 bash

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
