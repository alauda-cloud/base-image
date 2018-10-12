FROM java:8-alpine

RUN echo "http://mirrors.aliyun.com/alpine/v3.4/main/" > /etc/apk/repositories \
	&& apk update \
	&& apk upgrade \
	&& apk add --no-cache bash curl tzdata \
	&& cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& rm -rf /var/cache/apk/*

ENV JAVA_OPTS=${JAVA_OPTS}' -Djava.security.egd=file:/dev/./urandom '

CMD ["/bin/bash"]