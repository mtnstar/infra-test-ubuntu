FROM ubuntu:24.04

RUN apt-get update && \
      apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      gnupg \
      python3 python3-pip \
      lsb-release \
      sudo \
      && rm -rf /var/lib/apt/lists/*

RUN userdel -r ubuntu || true
RUN useradd -m -s /bin/bash test-admin \
  && echo "test-admin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

HEALTHCHECK CMD [ "ls", "/" ]

USER test-admin
