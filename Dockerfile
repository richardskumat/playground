FROM debian:bullseye-slim
RUN useradd -K UID_MIN=2600 -K UID_MAX=3000 -m -s /bin/bash user
RUN apt-get update && \
    apt-get install python3-minimal python3-setuptools python3-pip python3-wheel -y --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* && \
    apt-get clean
RUN pip3 install checkdmarc && rm -rf /root/.cache
USER user
ENTRYPOINT [ "checkdmarc" ]