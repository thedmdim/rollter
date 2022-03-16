FROM hwdsl2/ipsec-vpn-server:latest
RUN echo -e "http://dl-3.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories
RUN echo -e "http://dl-3.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update && apk upgrade
RUN apk add --no-cache tinyproxy tor i2pd
COPY ./tinyproxy.conf /etc/tinyproxy/tinyproxy.conf
RUN cp /etc/tor/torrc.sample /etc/tor/torrc
RUN echo "RunAsDaemon 1" >> /etc/tor/torrc
COPY ./setup_proxy.sh /opt/src/setup_proxy.sh
RUN chmod 755 /opt/src/setup_proxy.sh
CMD ["/opt/src/setup_proxy.sh"]