FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    dos2unix

RUN pip3 install PyYAML --break-system-packages

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN dos2unix /entrypoint.sh

RUN ls -l /entrypoint.sh


ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]