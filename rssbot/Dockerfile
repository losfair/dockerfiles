FROM rust:1-bullseye

WORKDIR /root
RUN apt update && \
  apt install -y git musl-tools && \
  rustup default nightly && \
  rustup target add x86_64-unknown-linux-musl && \
  git clone https://github.com/iovxw/rssbot
RUN cd rssbot && cargo build --release --target x86_64-unknown-linux-musl

FROM alpine:3
COPY --from=0 /root/rssbot/target/x86_64-unknown-linux-musl/release/rssbot /usr/bin/rssbot
ENTRYPOINT ["/usr/bin/rssbot"]
