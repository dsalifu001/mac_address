FROM --platform=linux/x86_64 alpine:3.16.0

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && apk update && apk add jq curl bash

ENV API_KEY=$at_xxxxxxx

COPY get_info.sh /root/get_info.sh

RUN chmod +x /root/get_info.sh

ENTRYPOINT [ "/root/get_info.sh" ]