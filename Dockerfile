ARG         ALPINE_VERSION=${ALPINE_VERSION:-latest}
FROM        arm64v8/alpine:${ALPINE_VERSION}

LABEL       maintainer="荒野无灯, hermsi1337"

ENV         ROOT_PASSWORD=root \
            KEYPAIR_LOGIN=false

ADD         entrypoint.sh /
RUN         apk add --upgrade --no-cache openssh \
            && chmod +x /entrypoint.sh \
	    && mkdir -p /root/.ssh \
	    && rm -rf /var/cache/apk/* /tmp/*

EXPOSE      22
VOLUME      ["/etc/ssh"]
ENTRYPOINT  ["/entrypoint.sh"]
