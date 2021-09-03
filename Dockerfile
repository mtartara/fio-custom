# Dockerfile for fio-pod
FROM docker.io/alpine

RUN apk add fio

CMD tail -f /dev/null
