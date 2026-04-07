FROM debian:trixie

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install --yes \
    ca-certificates \
    curl \
    git \
    golang \
    make \
    man \
    vim \
    && \
    rm -rf /var/lib/apt/lists/*

COPY bin/ /usr/bin/

RUN groupadd -g 1000 me && \
   useradd -m -d /home/me -s /bin/bash -u 1000 -g 1000 me

# Update the certificates installed with ca-certificates in case it's
# outdated.
RUN /usr/sbin/update-ca-certificates

USER me
WORKDIR /home/me
CMD cat /etc/os-release
