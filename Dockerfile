FROM debian:bullseye-slim
RUN apt update && \
apt install -y wget python3 openjdk-11-jdk && \
ln -s /usr/bin/python3 /usr/bin/python && \
wget https://repo1.maven.org/maven2/com/facebook/presto/presto-server/0.265.1/presto-server-0.265.1.tar.gz && \
tar xzvf presto-server-0.265.1.tar.gz && \
rm presto-server-0.265.1.tar.gz
WORKDIR /presto-server-0.265.1
COPY etc /presto-server-0.265.1/etc
CMD ["bin/launcher", "run"]