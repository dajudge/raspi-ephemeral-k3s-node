FROM ubuntu:focal

RUN apt update && \
    apt install -y curl sudo

RUN curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" > /usr/bin/kubectl && \
    chmod 755 /usr/bin/kubectl

RUN curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" > /usr/bin/docker-compose && \
    chmod 755 /usr/bin/docker-compose