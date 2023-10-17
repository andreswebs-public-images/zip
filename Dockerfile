FROM alpine:latest

ARG PUID=1000
ARG PGID=1000

RUN \
  addgroup -g "${PGID}" app && \
  adduser \
    -u "${PUID}" \
    -G app \
    -h /app \
    -D \
    app

RUN \
  apk add --no-cache zip unzip

WORKDIR /app

USER app

ENTRYPOINT ["/bin/bash", "-l"]
