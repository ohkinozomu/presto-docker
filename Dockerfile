FROM debian:bullseye-slim
ARG PRESTO_VERSION="0.267"
RUN apt update && \
apt install -y wget python3 openjdk-11-jdk && \
ln -s /usr/bin/python3 /usr/bin/python && \
wget https://repo1.maven.org/maven2/com/facebook/presto/presto-server/${PRESTO_VERSION}/presto-server-${PRESTO_VERSION}.tar.gz && \
tar xzvf presto-server-${PRESTO_VERSION}.tar.gz && \
rm presto-server-${PRESTO_VERSION}.tar.gz
WORKDIR /presto-server-${PRESTO_VERSION}
COPY etc /presto-server-${PRESTO_VERSION}/etc
CMD ["bin/launcher", "run"]