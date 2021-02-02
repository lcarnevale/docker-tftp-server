FROM alpine:latest
LABEL maintainer "Lorenzo Carnevale <lcarnevale@unime.it>" 
LABEL source "https://github.com/lcarnevale/docker-tftp-server"
LABEL branch "master"

VOLUME /var/tftpboot /var/tftpboot
VOLUME /var/log /var/log
COPY start-verbose-tftp-server.sh start-verbose-tftp-server.sh

RUN apk --no-cache --update --verbose update && \
    apk add --no-cache tftp-hpa

RUN chmod +x start-verbose-tftp-server.sh

EXPOSE 69/udp

ENTRYPOINT ["start-verbose-tftp-server.sh"]
CMD [""]