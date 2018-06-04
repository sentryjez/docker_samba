FROM alpine:latest
MAINTAINER Jens Merlier

ENV LANG C.UTF-8

RUN apk update \
	&& apk upgrade \
	&& apk add samba openrc \
	&& rc-update add samba
	
VOLUME ["/etc/samba", "/storage"]

EXPOSE 139 445

WORKDIR /

CMD ["/init"]