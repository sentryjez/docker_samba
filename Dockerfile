FROM alpine:latest
MAINTAINER: Jens Merlier

ENV LANG C.UTF-8

RUN apk update \
	&& apk upgrade \
	&& apk add samba openrc \
	&& rc-update add samba \
	&& rc-service samba start
	
VOLUME ["/etc/samba", "/storage"]

EXPOSE 139 445

WORKDIR /

CMD ["/bin/bash"]