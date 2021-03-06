FROM alpine

ENV LUA_VERSION 5.1.1

# Dependencies
RUN apk add --update make tar unzip gcc openssl-dev readline-dev curl libc-dev
RUN apk add ncurses-dev

RUN curl -L http://www.lua.org/ftp/lua-${LUA_VERSION}.tar.gz | tar xzf -
WORKDIR /lua-$LUA_VERSION

# build lua
RUN make linux test
RUN make install

WORKDIR /

# lua env
ENV WITH_LUA /usr/local/
ENV LUA_LIB /usr/local/lib/lua
ENV LUA_INCLUDE /usr/local/include

RUN rm /lua-$LUA_VERSION -rf
