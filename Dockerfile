FROM dockage/confd:alpine3.8
MAINTAINER Khashayar Danesh <khashayar.danesh@gmail.com>

LABEL org.label-schema.name="codesync" \
        org.label-schema.vendor="Dockage" \
        org.label-schema.description="CodeSync image Built on Alpine Linux" \
        org.label-schema.vcs-url="https://github.com/KhashayarDanesh/codesync" \
        org.label-schema.license="MIT"

COPY assets/root/ /

RUN apk --no-cache --update add inotify-tools rsync

