FROM alpine:latest
MAINTAINER Jens Merlier

ENV LANG C.UTF-8

RUN apk update \
	&& apk upgrade \
	&& apk add samba openrc \
	&& rc-update add samba
	
VOLUME ["/etc/samba/", "/storage/"]

COPY /assets/samba.conf /etc/samba/samba.conf
 
EXPOSE 139 445

WORKDIR /

CMD ["/bin/bash"]