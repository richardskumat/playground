FROM debian:buster-slim
RUN apt-get update && apt-get upgrade -y && apt-get clean
CMD [ "/bin/bash" ]