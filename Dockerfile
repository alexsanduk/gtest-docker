FROM alpine:3.14
LABEL maintainer=alexsanduk

# Args
ARG GTEST_VERSION="release-1.11.0"


RUN apk add --no-cache -q -f git cmake make g++

RUN git clone --depth 1 --branch ${GTEST_VERSION} https://github.com/google/googletest.git \
  && mkdir -p /googletest/build \
  && cd /googletest/build \
  && cmake .. && make && make install

COPY sample/Makefile ./
