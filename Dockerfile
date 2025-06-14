FROM debian:bookworm-slim

LABEL maintainer="khhangufran@gmail.com"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    # Networking & Debugging
    curl \
    iputils-ping \
    net-tools \
    iproute2 \
    telnet \
    traceroute \
    dnsutils \
    tcpdump \
    # Disk/Memory Tools
    htop \
    iotop \
    util-linux \
    procps \
    # SSH
    openssh-client \
    sshpass \
    # DB Clients
    mongodb-clients \
    postgresql-client \
    # Essential tools
    ca-certificates \
    gnupg \
    wget \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Kafka CLI tools (kafka-topics.sh etc.)
RUN mkdir -p /opt/kafka && \
    wget -qO- https://downloads.apache.org/kafka/3.7.0/kafka_2.13-3.7.0.tgz | tar xz --strip-components=1 -C /opt/kafka && \
    ln -s /opt/kafka/bin/* /usr/local/bin/

ENV PATH="/opt/kafka/bin:$PATH"

CMD [ "bash" ]
