FROM alpine:edge

RUN apk update && \
	apk add --no-cache --update bash && \
	mkdir -p /conf && \
	mkdir -p /conf-copy && \
	mkdir -p /aria2bin && \
	mkdir -p /data

ADD files/start.sh /conf-copy/start.sh
ADD files/aria2.conf /conf-copy/aria2.conf
ADD files/aria2c /aria2bin/aria2c

ENV PATH="/aria2bin:${PATH}"
RUN chmod +x /conf-copy/start.sh

WORKDIR /
VOLUME ["/data"]
VOLUME ["/conf"]
EXPOSE 6800
EXPOSE 80
EXPOSE 8080

CMD ["/conf-copy/start.sh"]
