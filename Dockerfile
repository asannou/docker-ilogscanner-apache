FROM eclipse-temurin:8-jre-alpine@sha256:9a8c4f5df370686e6f9f0da29e4f6fc0c42337a42bf0b0f55532b0cdc226df71

WORKDIR /root

RUN apk add --no-cache tzdata wget unzip \
  && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && echo "Asia/Tokyo" > /etc/timezone \
  && apk del tzdata

COPY entrypoint.sh .
ENTRYPOINT ["sh", "entrypoint.sh"]

VOLUME ["/jar", "/wd"]
