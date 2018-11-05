FROM ubuntu:16.04

MAINTAINER Andre Pereira andrespp@gmail.com

RUN apt-get update && apt-get install -y xauth x11-apps

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["xcalc"]
