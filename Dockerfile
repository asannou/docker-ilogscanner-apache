FROM eclipse-temurin:8-jre-alpine@sha256:51b833beb63a4c7cc0af7aa5e21835174e26cdc6181fc12d89f96d8fa1c0c7bd

WORKDIR /root

RUN apk add --no-cache tzdata wget unzip \
  && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && echo "Asia/Tokyo" > /etc/timezone \
  && apk del tzdata

COPY entrypoint.sh .
ENTRYPOINT ["sh", "entrypoint.sh"]

VOLUME ["/jar", "/wd"]
