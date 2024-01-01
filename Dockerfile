FROM eclipse-temurin:8-jre-alpine@sha256:d3d43199800eaa41238e4213fe4081cedc0a89e9f7c8a37f770d3bcf7071d55c

WORKDIR /root

RUN apk add --no-cache tzdata wget unzip \
  && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && echo "Asia/Tokyo" > /etc/timezone \
  && apk del tzdata

COPY entrypoint.sh .
ENTRYPOINT ["sh", "entrypoint.sh"]

VOLUME ["/jar", "/wd"]
