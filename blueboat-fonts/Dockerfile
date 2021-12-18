FROM ubuntu:20.04

WORKDIR /root
RUN apt update && \
  apt install -y wget unzip && \
  mkdir fonts && \
  cd fonts && \
  mkdir t && cd t && \
  wget -O Noto-Serif-SC.zip "https://fonts.google.com/download?family=Noto%20Serif%20SC" && \
  unzip Noto-Serif-SC.zip && \
  cd .. && cp ./t/NotoSerifSC-Regular.otf ./ && rm -rf t && \
  mkdir t && cd t && \
  wget -O Roboto.zip "https://fonts.google.com/download?family=Roboto" && \
  unzip Roboto.zip && \
  cd .. && cp ./t/Roboto-Light.ttf ./t/Roboto-Regular.ttf ./t/Roboto-Bold.ttf ./ && rm -rf t && \
  apt remove -y wget unzip && \
  apt clean
ENTRYPOINT ["/bin/sh", "-c", "cp -r /root/fonts/* /data/"]
