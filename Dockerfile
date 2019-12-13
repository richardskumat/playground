FROM debian:buster-slim
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install bash git curl wget -y
RUN curl ifconfig.co
CMD [ "echo", "hi", ]