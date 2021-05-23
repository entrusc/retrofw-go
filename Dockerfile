FROM golang:1.16.4-buster 

ENV GOOS=linux 
ENV GOARCH=mipsle
ENV GOMIPS=softfloat
ENV CGO_ENABLED=1
ENV CC=/cc/mipsel-linux-uclibc/usr/bin/mipsel-linux-gcc
ENV PKG_CONFIG_PATH=/cc/mipsel-linux-uclibc/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/pkgconfig
ENV CGO_CFLAGS="-I/cc/mipsel-linux-uclibc/mipsel-buildroot-linux-uclibc/sysroot/usr/include/SDL -D_GNU_SOURCE=1 -D_REENTRANT -fomit-frame-pointer -ffast-math -funroll-loops -DPLATFORM_DINGOO"
ENV CGO_LDFLAGS="-L/cc/mipsel-linux-uclibc/mipsel-buildroot-linux-uclibc/sysroot/usr/lib -Wall"

RUN mkdir /cc
RUN wget https://github.com/retrofw/buildroot/releases/download/2018.02.11/mipsel-linux-uclibc_x64.tar.gz -O /cc/mipsel-linux-uclibc_x64.tar.gz

RUN tar -C /cc -xzvf /cc/mipsel-linux-uclibc_x64.tar.gz
RUN rm /cc/mipsel-linux-uclibc_x64.tar.gz
