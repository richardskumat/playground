FROM debian:bullseye
ARG DEBIAN_FRONTEND=noninteractive
RUN sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN apt-get update && \
    apt-get install -y dhcp-helper && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* && \
    apt-get clean

RUN rm -f /lib/systemd/system/multi-user.target.wants/getty.target

VOLUME ["/sys/fs/cgroup"]
CMD ["/lib/systemd/systemd"]