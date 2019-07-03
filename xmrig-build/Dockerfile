FROM alpine:latest

RUN apk add --no-cache  --virtual .build-deps \
         git \
		 cmake \
		 make \
		 g++ \
		 musl-dev \
		 libuv-dev \
		 openssl-dev \
		 libmicrohttpd-dev \
 &&	mkdir -p /xmrig/build \
 && cd /xmrig \
 && git clone https://github.com/xmrig/xmrig.git \
 && cd build \
 && cmake ../xmrig \
 && make -j$(nproc) \
 && ./xmrig --version \
 && apk del .build-deps \
 && apk cache

VOLUME /exe

CMD cp /xmrig/build/xmrig /exe

