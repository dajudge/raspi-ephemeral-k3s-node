FROM ubuntu:focal

RUN apt update && \
    apt install -y curl

RUN curl https://github.com/k3s-io/k3s/releases/download/v1.20.4%2Bk3s1/k3s -L > /usr/bin/k3s && \
    chmod 755 /usr/bin/k3s
