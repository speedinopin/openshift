FROM alpine:latest

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk update && apk upgrade

RUN apk add --no-cache tor libffi-dev openssl chromium chromium-chromedriver bash nano htop \
    net-tools socat openssh-client openssh-server htop autossh python-dev \
    xvfb x11vnc tor dbus py-pip ttf-dejavu fluxbox xterm python3-dev gnupg rsync curl git jq

RUN rm -rf /var/cache/apk/*
RUN mkdir /.vnc && x11vnc -storepasswd secret /.vnc/passwd
COPY . /src
RUN chmod 600 client* server*

CMD bash /src/start.sh
