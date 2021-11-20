FROM ubuntu:20.04

RUN apt update && apt install -y git
COPY ./entrypoint.sh ./once.sh ./check.sh.inc /
COPY ./known_hosts /root/.ssh/known_hosts

ENTRYPOINT ["/entrypoint.sh"]
